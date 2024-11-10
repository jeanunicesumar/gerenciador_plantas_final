
class Irrigacao {
  final String? _id;
  final String _horario;
  final int _tempo;
  final int _vazao;

  Irrigacao({
    required String? id,
    required String horario,
    required int tempo,
    required int vazao,
  })  : _id = id,
        _horario = horario,
        _tempo = tempo,
        _vazao = vazao;

  String? get id => _id;
  String get horario => _horario;
  int get tempo => _tempo;
  int get vazao => _vazao;

  factory Irrigacao.fromJson(Map<String, dynamic> json) {
    return Irrigacao(
        id: json['id'],
        horario: json['horario'],
        tempo: json['tempo'],
        vazao: json['vazao']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": _id,
      "horario": _horario,
      "tempo": _tempo,
      "vazao": _vazao,
    };
  }
}
