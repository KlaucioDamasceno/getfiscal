const String tipoRegistroDefault = "PP";

class ProfissionalModel {
  final String nome;
  final String cpf;
  final String dataNascimento;
  final String registroNacional;
  final String sexo;
  final String nacionalidade;
  final String naturalidade;
  final String ufNaturalidade;
  final String titulos;
  final String nomePai;
  final String nomeMae;
  final String regionalEmail;
  final String regionalTelefone;
  final String foto;
  final String msgInfoResolucao;
  final String dataHoraEmissao;
  final String codigoValidacao;
  final String qrCodeValicao;
  String dataRegistro;
  String tipoRegistro;
  String situacaoRegistroAtual;
  String ultimaAnuidadePaga;
  String regional;
  String regionalSigla;
  String email;
  String enderecoCorrespondencia;
  String situacaoAnuidade;
  String dataHoraAtualizacao;
  String hashPassword;

  ProfissionalModel({
    required this.nome,
    required this.cpf,
    required this.dataNascimento,
    required this.registroNacional,
    required this.sexo,
    required this.nacionalidade,
    required this.naturalidade,
    required this.ufNaturalidade,
    required this.titulos,
    required this.nomePai,
    required this.nomeMae,
    required this.regionalEmail,
    required this.regionalTelefone,
    required this.foto,
    required this.msgInfoResolucao,
    required this.dataHoraEmissao,
    required this.codigoValidacao,
    required this.qrCodeValicao,
    required this.dataRegistro,
    required this.tipoRegistro,
    required this.situacaoRegistroAtual,
    required this.ultimaAnuidadePaga,
    required this.regional,
    required this.regionalSigla,
    required this.email,
    required this.enderecoCorrespondencia,
    required this.situacaoAnuidade,
    required this.dataHoraAtualizacao,
    required this.hashPassword,
  });

  factory ProfissionalModel.fromJson(Map<String, dynamic> json) {
    //Formatando Titulos
    String _formatTitulos(String t) {
      return t.replaceAll(new RegExp(r'\,\s?'), "\n");
    }

    return ProfissionalModel(
      cpf: json["cpf"],
      nome: json["nome"],
      dataNascimento: json["dataNascimento"],
      titulos: _formatTitulos(json["titulos"]),
      registroNacional: json["registroNacional"],
      sexo: json["sexo"],
      nacionalidade: json["nacionalidade"],
      naturalidade: json["naturalidade"],
      ufNaturalidade: json["ufNaturalidade"],
      dataRegistro: json["dataRegistro"],
      tipoRegistro: json["tipoRegistro"] == null
          ? tipoRegistroDefault
          : json["tipoRegistro"],
      situacaoRegistroAtual: json["situacaoRegistroAtual"],
      ultimaAnuidadePaga: json["ultimaAnuidadePaga"],
      nomePai: json["nomePai"],
      nomeMae: json["nomeMae"],
      regional: json["regional"],
      regionalSigla: json["regionalSigla"],
      regionalEmail: json["regionalEmail"],
      regionalTelefone: json["regionalTelefone"],
      foto: json["foto"],
      msgInfoResolucao: json["msgInfoResolucao"],
      dataHoraEmissao: json["dataHoraEmissao"],
      codigoValidacao: json["codigoValidacao"],
      qrCodeValicao: json["qrCodeValicao"],
      email: json["email"],
      enderecoCorrespondencia: json["enderecoCorrespondencia"],
      situacaoAnuidade: json["situacaoAnuidade"],
      dataHoraAtualizacao: json["data_hora"] == null
          ? json["dataHoraEmissao"]
          : json["data_hora"],
      hashPassword: json["hashPassword"],
    );
  }

  factory ProfissionalModel.fromMap(Map m) {
    return ProfissionalModel(
      cpf: m["cpf"],
      nome: m["nome"],
      dataNascimento: m["dataNascimento"],
      titulos: (m["titulos"]),
      registroNacional: m["registroNacional"],
      sexo: m["sexo"],
      nacionalidade: m["nacionalidade"],
      naturalidade: m["naturalidade"],
      ufNaturalidade: m["ufNaturalidade"],
      dataRegistro: m["dataRegistro"],
      tipoRegistro:
          m["tipoRegistro"] == null ? tipoRegistroDefault : m["tipoRegistro"],
      situacaoRegistroAtual: m["situacaoRegistroAtual"],
      ultimaAnuidadePaga: m["ultimaAnuidadePaga"],
      nomePai: m["nomePai"],
      nomeMae: m["nomeMae"],
      regional: m["regional"],
      regionalSigla: m["regionalSigla"],
      regionalTelefone: m["regionalTelefone"],
      regionalEmail: m["regionalEmail"],
      foto: m["foto"],
      msgInfoResolucao: m["msgInfoResolucao"],
      dataHoraEmissao: m["dataHoraEmissao"],
      codigoValidacao: m["codigoValidacao"],
      qrCodeValicao: m["qrCodeValicao"],
      email: m["email"],
      enderecoCorrespondencia: m["enderecoCorrespondencia"],
      situacaoAnuidade: m["situacaoAnuidade"],
      dataHoraAtualizacao: m['dataHoraAtualizacao'],
      hashPassword: m["hashPassword"],
    );
  }

  Map toMap() {
    Map m = {
      "cpf": cpf,
      "nome": nome,
      "dataNascimento": dataNascimento,
      "titulos": titulos,
      "registroNacional": registroNacional,
      "sexo": sexo,
      "nacionalidade": nacionalidade,
      "naturalidade": naturalidade,
      "ufNaturalidade": ufNaturalidade,
      "dataRegistro": dataRegistro,
      "tipoRegistro":
          tipoRegistro.length == 0 ? tipoRegistroDefault : tipoRegistro,
      "situacaoRegistroAtual": situacaoRegistroAtual,
      "ultimaAnuidadePaga": ultimaAnuidadePaga,
      "nomePai": nomePai,
      "nomeMae": nomeMae,
      "regional": regional,
      "regionalSigla": regionalSigla,
      "regionalEmail": regionalEmail,
      "regionalTelefone": regionalTelefone,
      "foto": foto,
      "msgInfoResolucao": msgInfoResolucao,
      "dataHoraEmissao": dataHoraEmissao,
      "codigoValidacao": codigoValidacao,
      "qrCodeValicao": qrCodeValicao,
      "email": email,
      "enderecoCorrespondencia": enderecoCorrespondencia,
      "situacaoAnuidade": situacaoAnuidade,
      "dataHoraAtualizacao": dataHoraAtualizacao,
      "hashPassword": hashPassword,
    };

    return m;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cpf'] = this.cpf;
    data['email'] = this.email;

    return data;
  }
}
