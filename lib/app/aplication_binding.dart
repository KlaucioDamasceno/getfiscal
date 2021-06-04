import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getfiscal/app/global/constants.dart';

class AplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio(BaseOptions(
          baseUrl: baseUrl,
          headers: {'Authorization': 'Basic $token'},
        )));
  }
}
