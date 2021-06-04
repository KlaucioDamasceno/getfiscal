import 'package:get/get.dart';
import 'package:getfiscal/app/modules/home/views/home_page.dart';
import 'package:getfiscal/app/modules/initial/bindings/initial_bindings.dart';
import 'package:getfiscal/app/modules/initial/views/initial_page.dart';
import 'package:getfiscal/app/modules/login/bindings/login_bindings.dart';
import 'package:getfiscal/app/modules/login/views/login_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
  ];
}
