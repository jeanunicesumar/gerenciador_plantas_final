import 'dart:convert';

import 'package:gerenciador_planta/core/entity/http_response.dart';
import 'package:gerenciador_planta/core/http_client.dart';
import 'package:gerenciador_planta/models/planta.dart';

const String urlComRota = 'http://localhost:3000/plantas';

abstract interface class IPlantaService {
  Future<List<Planta>> fetch();
  Future<Planta> fetchById(String id);
  Future<bool> insert(Planta planta);
  Future<bool> update(Planta planta);
  Future<bool> delete(String id);
}

class PlantaService implements IPlantaService {
  final IHttpClient httpClient;
  const PlantaService(this.httpClient);

  @override
  Future<List<Planta>> fetch() async {
    try {
      final HttpResponse response = await httpClient.get(urlComRota);
      return response.toSuccess() ? (response.data as List).map<Planta>((json) => Planta.fromJson(json)).toList() : [];
    } catch (_) {
      rethrow;
    }
  }
  
  @override
  Future<Planta> fetchById(String id) async {
    try {
      final HttpResponse response = await httpClient.get(urlComRota + id);
      if (response.toSuccess()) {
        return Planta.fromJson(response.data);
      } else {
        throw Exception('Planta não encontrada');
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> insert(Planta planta) async {
    try {
      final String json = jsonEncode(planta.toJson());
      final HttpResponse response = await httpClient.post(urlComRota, data: json);
      if (!response.toSuccess()) throw Exception('Não foi possível inserir a planta');
      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> update(Planta planta) async {
    try {
      final String json = jsonEncode(planta.toJson());
      final HttpResponse response = await httpClient.put('$urlComRota/${planta.id}', data: json);
      if (!response.toSuccess()) throw Exception('Não foi possível atualizar a planta.');
      return response.statusCode == 200;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> delete(String id) async {
    try {
      final HttpResponse response = await httpClient.delete('$urlComRota/$id');
      if (!response.toSuccess()) throw Exception('Não foi possível remover a planta.');
      return response.statusCode == 200;
    } catch (_) {
      rethrow;
    }
  }
}

extension _HttpExtension on HttpResponse {
  bool toSuccess() {
    return ((statusCode ?? 0) >= 200) && ((statusCode ?? 0) <= 299);
  }
}