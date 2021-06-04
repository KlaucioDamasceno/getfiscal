import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getfiscal/app/modules/initial/controllers/initial_controller.dart';
import 'package:splashscreen/splashscreen.dart';

class InitialPage extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashScreen(
          seconds: 5,
          gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.cyan,
              Colors.grey,
            ],
          ),
          navigateAfterSeconds: controller.verifyAuth(),
          loaderColor: Colors.transparent,
        ),
        Container(
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "images/brasao.png",
                ),
                fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }
}
