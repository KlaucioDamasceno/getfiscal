import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getfiscal/app/modules/home/controlles/home_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(centerTitle: true, title: Text('HomePage'), backgroundColor: Colors.white,),
        body: Container(
          color: Get.theme.primaryColor,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Demo app'),
              ],
            ),

        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white,
          backgroundColor: Get.theme.primaryColor,
          buttonBackgroundColor: Colors.white,
          height: 50,
          items: [
            Icon(Icons.credit_card, size: 20, color: Get.theme.primaryColor,),
            Icon(Icons.home, size: 20, color: Get.theme.primaryColor,),
            Icon(Icons.perm_contact_cal_outlined, size: 20, color: Get.theme.primaryColor,),

          ],
          onTap: (index){
            print("Current index is $index");
          },
        ),
    );
  }
}
