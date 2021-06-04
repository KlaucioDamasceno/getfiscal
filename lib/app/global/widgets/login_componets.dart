import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Image.asset(
          'images/republica_login.png',
          height: 100,
        ),
        Text(
          "CFT/CRT",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              fontFamily: 'Calibri',
              color: Colors.white),
        ),
        Text(
          "Conselho Federal dos Técnicos Industriais",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Calibri',
              color: Colors.white),
        ),
        Text(
          "Conselho Regional dos Técnicos Industriais",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Calibri',
              color: Colors.white),
        ),
      ],
    );
  }
}

class CPFInput extends StatelessWidget {
  /*  var cpfMaskFormatter = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
 */
  final String hintText;
  final ValueChanged<String> onChanged;
  final controller;

  const CPFInput({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Campo requerido.";
          }
          return null;
        },
        controller: controller,
        onChanged: onChanged,
        cursorColor: Get.theme.primaryColor,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_contact_calendar_outlined),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PassInput extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final controller;
  bool showPassword;
  PassInput(
      {required Key? key,
      this.controller,
      required this.onChanged,
      this.showPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
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
        controller: controller,
        obscureText: !showPassword,
        onChanged: onChanged,
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
                controller.showPassword.value = !controller.showPassword.value,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final String text;
  final controller;

  const SubmitButton({Key? key, required this.text, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: Get.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: Get.theme.primaryColor,
          onPressed: () => controller.login(),
          child: Text(
            text,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
