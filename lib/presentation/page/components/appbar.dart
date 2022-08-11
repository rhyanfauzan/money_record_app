import 'package:course_money_record/config/app_asset.dart';
import 'package:course_money_record/config/app_color.dart';
import 'package:course_money_record/presentation/controller/c_user.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarComponent extends StatefulWidget {
  const AppBarComponent({Key? key}) : super(key: key);

  @override
  State<AppBarComponent> createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {
  final cUser = Get.put(CUser());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
      child: Row(
        children: [
          Image.asset(
            AppAsset.profile,
            width: 40,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Obx(() {
                  return Text(
                    cUser.data.name ?? '',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  );
                })
              ],
            ),
          ),
          Builder(builder: (ctx) {
            return Material(
              borderRadius: BorderRadius.circular(4),
              color: AppColor.primary,
              child: InkWell(
                onTap: () {
                  Scaffold.of(ctx).openEndDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
