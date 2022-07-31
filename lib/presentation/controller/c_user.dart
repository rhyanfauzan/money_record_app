import 'package:course_money_record/data/model/user.dart';
import 'package:get/get.dart';

class CUser extends GetxController {
  final _data = User().obs;
  User get data => data.value;
  setData(n) => _data.value = n;
}
