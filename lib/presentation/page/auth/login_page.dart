import 'package:course_money_record/config/app_asset.dart';
import 'package:course_money_record/config/app_color.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DView.nothing(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Image.asset(
                    AppAsset.logo,
                    scale: 20,
                  ),
                  DView.spaceHeight(40),
                  TextField(
                    controller: controllerEmail,
                    decoration: InputDecoration(
                        fillColor: AppColor.primary.withOpacity(0.5),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'email',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        )),
                  ),
                  TextField(
                    controller: controllerPassword,
                    decoration: InputDecoration(
                        fillColor: AppColor.primary.withOpacity(0.5),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'password',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belum punya akun? '),
                  Text(
                    'Register',
                    style: TextStyle(color: AppColor.primary),
                  )
                ],
              ),
            )
          ],
        );
      },
    ));
  }
}
