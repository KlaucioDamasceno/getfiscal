import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:getfiscal/app/data/model/profissional_model.dart';


class LoginRepository {
  final Dio client;
  LoginRepository({
    required this.client,
  });
  /* final LoginApiClient apiClient = Get.find<LoginApiClient>();

  Future<ProfissionalModel> getCarteiraProfissional(cpf, senha) async {
    var json = await apiClient.getCateiraProfissional(cpf, senha);
    print(json);
    return ProfissionalModel.fromJson(json);
  } */

  FutureOr<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('corporativo.sinceti.net.br');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }

  getVerifyLogin(cpf, senha) async {
    try {
      bool testConnection = await this.checkConnection();

      if (testConnection == false) {
        throw ("Sem conexão com Servidor/Internet.");
      }

      Response response =
          await client.get('/getProfissionalCarteira', queryParameters: {
        "cpf": cpf,
        "senha": textToMd5(senha),
      });
      if (response.statusCode == 200) {
        var j = json.decode(response.data);
        if(j != null){
          return true;
        }
        return false;
      }
    } on DioError catch (e) {
      switch (e.response!.statusCode) {
        case 404:
          throw ("Falha na Conexão do Sistema");
        case 401:
          var msgError = jsonDecode(e.response!.data);
          if (msgError["error"]["message"] != null) {
            throw (msgError["error"]);
          } else {
            throw ("Problema na validação");
          }
        case 500:
          throw ("Falha no Login, CPF ou Senha Inválido");
        default:
          throw ("Problema na conexão");
      }
    }
  }

  String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}
