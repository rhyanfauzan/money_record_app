import 'package:course_money_record/config/app_color.dart';
import 'package:course_money_record/config/app_format.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/c_home.dart';
import '../../controller/c_user.dart';

class ChartComponent extends StatefulWidget {
  const ChartComponent({Key? key}) : super(key: key);

  @override
  State<ChartComponent> createState() => _ChartComponentState();
}

class _ChartComponentState extends State<ChartComponent> {
  final cUser = Get.put(CUser());
  final cHome = Get.put(CHome());
  @override
  void initState() {
    cHome.getAnalysis(cUser.data.idUser!);
    super.initState();
  }

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
            child: Obx(() {
              return DChartBar(
                data: [
                  {
                    'id': 'Bar',
                    'data': List.generate(7, (index) {
                      return {
                        'domain': cHome.weekText()[index],
                        'measure': cHome.week[index]
                      };
                    })
                  },
                ],
                domainLabelPaddingToAxisLine: 8,
                axisLineTick: 2,
                axisLineColor: AppColor.primary,
                measureLabelPaddingToAxisLine: 16,
                barColor: (barData, index, id) => AppColor.primary,
                showBarValue: true,
              );
            }),
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
          monthly(context)
        ],
      ),
    );
  }

  Row monthly(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.5,
          child: Stack(
            children: [
              Obx(() {
                return DChartPie(
                  data: [
                    {'domain': 'income', 'measure': cHome.monthIncome},
                    {'domain': 'outcome', 'measure': cHome.monthOutcome},
                    if (cHome.monthIncome == 0 && cHome.monthOutcome == 0)
                      {'domain': 'nol', 'measure': 1},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'income':
                        return AppColor.primary;
                      case 'outcome':
                        return AppColor.chart;
                      default:
                        return AppColor.bg.withOpacity(0.5);
                    }
                  },
                  donutWidth: 20,
                  labelColor: Colors.transparent,
                  showLabelLine: false,
                );
              }),
              Center(
                child: Obx(() {
                  return Text(
                    '${cHome.percentIncome}%',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: AppColor.primary,
                        ),
                  );
                }),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    color: AppColor.primary,
                  ),
                  DView.spaceWidth(8),
                  const Text('Pemasukan'),
                ],
              ),
              DView.spaceHeight(8),
              Row(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    color: AppColor.chart,
                  ),
                  DView.spaceWidth(8),
                  const Text('Pengeluaran'),
                ],
              ),
              DView.spaceHeight(20),
              Obx(() {
                return Text(cHome.monthPercent);
              }),
              DView.spaceHeight(10),
              const Text('Atau setara:'),
              Obx(() {
                return Text(
                  AppFormat.currency(cHome.differentMonth.toString()),
                  style: const TextStyle(
                    color: AppColor.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ],
          ),
        ),
      ],
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
                      cHome.todayPercents,
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
