import 'package:course_money_record/config/app_asset.dart';
import 'package:course_money_record/config/app_color.dart';
import 'package:course_money_record/config/session.dart';
import 'package:course_money_record/presentation/controller/c_user.dart';
import 'package:course_money_record/presentation/page/auth/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EndDrawerComponent extends StatefulWidget {
  const EndDrawerComponent({Key? key}) : super(key: key);

  @override
  State<EndDrawerComponent> createState() => _EndDrawerComponentState();
}

class _EndDrawerComponentState extends State<EndDrawerComponent> {
  final cUser = Get.put(CUser());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          margin: EdgeInsets.only(bottom: 0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAsset.profile,
                      width: 22,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() {
                            return Text(
                              cUser.data.name ?? '',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            );
                          }),
                          Obx(() {
                            return Text(
                              cUser.data.email ?? '',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 12),
                            );
                          })
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  color: Colors.pink.shade500,
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.add),
          horizontalTitleGap: 0,
          title: const Text('Tambah Baru'),
          trailing: const Icon(Icons.navigate_next),
        ),
        const Divider(height: 1),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.south_east),
          horizontalTitleGap: 0,
          title: const Text('Pemasukan'),
          trailing: const Icon(Icons.navigate_next),
        ),
        const Divider(height: 1),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.north_west),
          horizontalTitleGap: 0,
          title: const Text('Pengeluaran'),
          trailing: const Icon(Icons.navigate_next),
        ),
        const Divider(height: 1),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.history),
          horizontalTitleGap: 0,
          title: const Text('History'),
          trailing: const Icon(Icons.navigate_next),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
