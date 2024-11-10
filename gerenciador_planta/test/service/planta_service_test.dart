import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_planta/models/irrigacao.dart';
import 'package:gerenciador_planta/models/planta.dart';
import 'package:gerenciador_planta/service/planta_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'planta_service_test.mocks.dart';


@GenerateNiceMocks([MockSpec<PlantaService>()])
void main() {

  late MockPlantaService mockAppService;
  final Planta planta = Planta(
    id: "12",
    nome: "Planta",
    descricao: "Uma planta",
    regiao: "Norte",
    tipo: "Suculenta",
    url: "http://teste",
    irrigacao: Irrigacao(
      id: "1",
      horario: "12:20",
      tempo: 12,
      vazao: 12,
    ),
  );

  setUp(() {
    mockAppService = MockPlantaService();

    when(mockAppService.fetch()).thenAnswer((_) async => [planta]);
    when(mockAppService.fetchById("12")).thenAnswer((_) async => planta);
    when(mockAppService.fetchById("13"))
        .thenThrow(Exception('Planta not found'));
    when(mockAppService.insert(planta)).thenAnswer((_) async => true);
  });

  test('deve retornar dados da planta', () async {
    final List<Planta> plantas = await mockAppService.fetch();

    expect(plantas, isNotEmpty);
    expect(plantas[0].id, "12");
    expect(plantas[0].nome, "Planta");
    expect(plantas[0].descricao, "Uma planta");
    expect(plantas[0].regiao, "Norte");
    expect(plantas[0].tipo, "Suculenta");
    expect(plantas[0].url, "http://teste");
    expect(plantas[0].irrigacao.id, "1");
    expect(plantas[0].irrigacao.horario, "12:20");
    expect(plantas[0].irrigacao.tempo, 12);
    expect(plantas[0].irrigacao.vazao, 12);
  });

  test('deve retornar a planta correta pelo ID', () async {
    final Planta planta = await mockAppService.fetchById("12");

    expect(planta.id, "12");
    expect(planta.nome, "Planta");
    expect(planta.descricao, "Uma planta");
    expect(planta.regiao, "Norte");
    expect(planta.tipo, "Suculenta");
    expect(planta.url, "http://teste");
    expect(planta.irrigacao.id, "1");
    expect(planta.irrigacao.horario, "12:20");
    expect(planta.irrigacao.tempo, 12);
    expect(planta.irrigacao.vazao, 12);
  });

  test('deve lançar uma exceção se o ID não for encontrado', () async {
    expect(
      () async => await mockAppService.fetchById("13"),
      throwsA(isA<Exception>()),
    );
  });

  test('deve criar uma nova planta', () async {
    final bool plantaCriada = await mockAppService.insert(planta);

    expect(plantaCriada, true);
  });
}