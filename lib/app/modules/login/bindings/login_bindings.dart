import 'package:get/get.dart';
import 'package:getfiscal/app/data/provider/login_provider.dart';
import 'package:getfiscal/app/data/repository/login_repository.dart';
import 'package:getfiscal/app/modules/login/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginRepository>(() => LoginRepository(client: Get.find()));
    Get.lazyPut<LoginApiClient>(() => LoginApiClient());
  }
}
