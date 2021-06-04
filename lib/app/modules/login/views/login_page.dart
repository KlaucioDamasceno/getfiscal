import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getfiscal/app/global/widgets/login_componets.dart';
import 'package:getfiscal/app/modules/login/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.blue.shade900,
                Colors.blue.shade800,
                Colors.blue.shade400
              ],
            ),
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: Get.height * 0.03),
                HeadScreen(),
                SizedBox(height: Get.height * 0.015),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 118, 159, 204),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              CPFInput(
                                hintText: "CPF",
                                controller: controller.usernameCtrl,
                                onChanged: (value) {},
                              ),
                              Obx(
                                () => Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200)),
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Campo requerido.';
                                      }
                                      if (value.length <= 5) {
                                        return 'Campo requer mínimo 6 caracteres.';
                                      }
                                      return null;
                                    },
                                    obscureText: controller.showPassword.value,
                                    controller: controller.passwordCtrl,
                                    onChanged: (value) {},
                                    cursorColor: Get.theme.primaryColor,
                                    decoration: InputDecoration(
                                      hintText: "Senha",
                                      prefixIcon: Icon(
                                        Icons.lock,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.visibility,
                                          color: Get.theme.primaryColor,
                                        ),
                                        onPressed: () =>
                                            controller.showPassword.value =
                                                !controller.showPassword.value,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: !controller.loading.value,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    width: Get.width * 0.8,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(29),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 40),
                                        color: Get.theme.primaryColor,
                                        onPressed: () => controller.login(),
                                        child: Text(
                                          "Acessar",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: controller.loading.value,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    width: Get.width * 0.8,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(29),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 20,
                                          horizontal: 40,
                                        ),
                                        onPressed: null,
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
