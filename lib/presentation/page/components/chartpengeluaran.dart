import 'package:course_money_record/config/app_color.dart';
import 'package:course_money_record/config/app_format.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controller/c_home.dart';

class ChartComponent extends StatefulWidget {
  const ChartComponent({Key? key}) : super(key: key);

  @override
  State<ChartComponent> createState() => _ChartComponentState();
}

class _ChartComponentState extends State<ChartComponent> {
  final cHome = Get.put(CHome());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pengeluaran Harini Ini',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          DView.spaceHeight(10),
          cardToday(),
          DView.spaceHeight(30),
          Text(
            'Pengeluaran Minggu Ini',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          DView.spaceHeight(10),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: DChartBar(
              data: [
                {
                  'id': 'Bar',
                  'data': [
                    {'domain': '2020', 'measure': 3},
                    {'domain': '2021', 'measure': 4},
                    {'domain': '2022', 'measure': 6},
                    {'domain': '2023', 'measure': 0.3},
                  ],
                },
              ],
              domainLabelPaddingToAxisLine: 16,
              axisLineTick: 2,
              axisLinePointTick: 2,
              axisLinePointWidth: 10,
              axisLineColor: Colors.green,
              measureLabelPaddingToAxisLine: 16,
              barColor: (barData, index, id) => Colors.green,
              showBarValue: true,
            ),
          ),
          DView.spaceHeight(30),
          Text(
            'Perbandingan Bulan Ini',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          DView.spaceHeight(10),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Stack(
                  children: [
                    DChartPie(
                      data: [
                        {'domain': 'Flutter', 'measure': 28},
                        {'domain': 'React Native', 'measure': 27},
                      ],
                      fillColor: (pieData, index) => Colors.purple,
                      donutWidth: 30,
                      labelColor: Colors.white,
                    ),
                    Center(child: Text('60%'))
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        color: AppColor.primary,
                      ),
                      DView.spaceWidth(8),
                      const Text('Pemasukan'),
                    ],
                  ),
                  DView.spaceHeight(6),
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        color: AppColor.chart,
                      ),
                      DView.spaceWidth(8),
                      const Text('Pengeluaran'),
                    ],
                  ),
                  DView.spaceHeight(20),
                  Text('Pemasukan'),
                  Text('Lebih besar 20%'),
                  Text('dari pengeluaran'),
                  DView.spaceHeight(10),
                  Text('Atau setara'),
                  Text(
                    'Rp. 20.000',
                    style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Material cardToday() {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: AppColor.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    return Text(
                      AppFormat.currency(cHome.today.toString()),
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    );
                  }),
                  DView.spaceHeight(6),
                  Obx(() {
                    return Text(
                      cHome.todayPercent,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    );
                  })
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Row(
                children: [
                  Expanded(child: Column()),
                  Column(
                    children: [
                      Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Selengkapnya',
                                  style: TextStyle(
                                      color: AppColor.primary, fontSize: 12)),
                              Icon(
                                Icons.arrow_right_rounded,
                                color: AppColor.primary,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
