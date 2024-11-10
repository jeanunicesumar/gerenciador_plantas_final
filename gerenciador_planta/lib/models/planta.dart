
import 'package:gerenciador_planta/models/irrigacao.dart';

class Planta {
  final String? _id;
  final String _nome;
  final String _descricao;
  final String _regiao;
  final String _tipo;
  final String _url;
  final Irrigacao _irrigacao;

  Planta({
    required String? id,
    required String nome,
    required String descricao,
    required String regiao,
    required String tipo,
    required String url,
    required Irrigacao irrigacao,
  })  : _id = id,
        _nome = nome,
        _descricao = descricao,
        _regiao = regiao,
        _tipo = tipo,
        _url = url,
        _irrigacao = irrigacao;

  String? get id =>  _id;
  String get nome => _nome;
  String get descricao => _descricao;
  String get regiao => _regiao;
  String get tipo => _tipo;
  String get url => _url;
  Irrigacao get irrigacao => _irrigacao;

  factory Planta.fromJson(Map<String, dynamic> json) {
    return Planta(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      regiao: json['regiao'],
      tipo: json['tipo'],
      url: json['url'],
      irrigacao: Irrigacao.fromJson(json['irrigacao']),
      );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": _id,
      "nome": _nome,
      "descricao": _descricao,
      "regiao": _regiao,
      "tipo": _tipo,
      "url": _url,
      "irrigacao": _irrigacao.toJson()
    };
  }

}
