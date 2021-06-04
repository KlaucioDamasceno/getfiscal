import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getfiscal/app/routes/app_pages.dart';

class InitialController extends GetxController {
  var auth;
  final box = GetStorage('etecnico');

  String verifyAuth() {
    auth = box.read('auth');
    if (auth != null) {
      return Routes.HOME;
    } else {
      return Routes.LOGIN;
    }
  }
}
