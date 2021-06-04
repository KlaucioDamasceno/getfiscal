import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getfiscal/app/aplication_binding.dart';
import 'package:getfiscal/app/routes/app_pages.dart';
import 'package:getfiscal/app/theme/app_theme.dart';

Future<void> main() async {
  await GetStorage.init('etecnico');
  runApp(GetMaterialApp(
    title: "Get Efiscal",
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    getPages: AppPages.pages,
    initialRoute: Routes.INITIAL,
    initialBinding: AplicationBinding(),
  ));
}
//teste de implementação