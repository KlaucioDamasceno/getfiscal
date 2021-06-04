import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getfiscal/app/global/constants.dart';

class LoginApiClient extends GetConnect {
  final box = GetStorage('etecnico');

  getCateiraProfissional(String cpf, String senha) async {
    var response = await get(baseUrl + "/getProfissionalCarteira",
        headers: {'Authorization': 'Basic $token'},
        query: {"cpf": cpf, "senha": textToMd5(senha)});

    //print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      Get.defaultDialog(
          title: "Login", content: Text("Login/Senha não confere."));
      return null;
    }
  }

  /*
    Converte a senha para MD5
   */
  String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}
