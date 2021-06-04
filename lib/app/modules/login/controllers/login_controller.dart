import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getfiscal/app/data/model/profissional_model.dart';
import 'package:getfiscal/app/data/repository/login_repository.dart';
import 'package:getfiscal/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final box = GetStorage('etecnico');
  final repository = Get.find<LoginRepository>();
  final formKey = GlobalKey<FormState>();

  RxBool showPassword = true.obs;
  RxBool loading = false.obs;


  void login() async {
    if (formKey.currentState!.validate()) {
      loading.value = true;
      await repository.getVerifyLogin(usernameCtrl.text, passwordCtrl.text).then((auth) {
        if (auth) {
          box.write('auth', auth);
          Get.offAllNamed(Routes.HOME);
        }
        loading.value = false;
      }).catchError((err) {
        loading.value = false;
      });
    }
  }
}