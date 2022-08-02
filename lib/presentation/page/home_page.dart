import 'package:course_money_record/config/session.dart';
import 'package:course_money_record/presentation/page/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        children: [
          Text('Home Page'),
          IconButton(
            onPressed: () {
              Session.clearUser();
              Get.off(() => const LoginPage());
            },
            icon: Icon(Icons.logout),
          ),
        ],
      )),
    );
  }
}
