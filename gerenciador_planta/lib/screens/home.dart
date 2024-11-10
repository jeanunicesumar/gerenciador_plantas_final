import 'package:flutter/material.dart';
import 'package:gerenciador_planta/components/planta_home.dart';
import 'package:gerenciador_planta/core/http_client.dart';
import 'package:gerenciador_planta/models/planta.dart';
import 'package:gerenciador_planta/screens/form.dart';
import 'package:gerenciador_planta/service/planta_service.dart';
import 'package:gerenciador_planta/utils/list_utils.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late Future<List<Planta>> _plantasFuture;

  @override
  void initState() {
    super.initState();
    _plantasFuture = _fetchPlantas();
  }

  Future<List<Planta>> _fetchPlantas() async {
    final http.Client httpClientInstance = http.Client();
    final customHttpClient = HttpClient(httpClientInstance);
    final plantaService = PlantaService(customHttpClient);

    final plantas = await plantaService.fetch();
    return plantas;
  }

  void _refreshPlantas() {
    setState(() {
      _plantasFuture = _fetchPlantas();
    });
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Planta>>(
      future: _plantasFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Erro: ${snapshot.error}')),
          );
        } else {
          final plantas = snapshot.data!;
          final tipoContagem = ListUtils.getContagemTipo(plantas);
          final regiaoContagem = ListUtils.getContagemRegiao(plantas);

          return Scaffold(
            body: PlantaHome(
              plantas: plantas,
              tipoContagem: tipoContagem,
              regiaoContagem: regiaoContagem,
              refresh: _refreshPlantas,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(121, 0, 255, 68),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormPlanta()),
                );
                _refreshPlantas();
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}
