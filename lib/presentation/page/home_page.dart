import 'package:course_money_record/config/app_asset.dart';
import 'package:course_money_record/config/app_color.dart';
import 'package:course_money_record/presentation/controller/c_home.dart';
import 'package:course_money_record/presentation/controller/c_user.dart';
import 'package:course_money_record/presentation/page/components/appbar.dart';
import 'package:course_money_record/presentation/page/components/chartpengeluaran.dart';
import 'package:course_money_record/presentation/page/components/enddrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cUser = Get.put(CUser());
  final cHome = Get.put(CHome());

  @override
  void initState() {
    cHome.getAnalysis(cUser.data.idUser!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
          child: EndDrawerComponent(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [AppBarComponent(), ChartComponent()],
          ),
        ));
  }
}
