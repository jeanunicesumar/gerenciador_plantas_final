import 'package:flutter/material.dart';
import 'package:gerenciador_planta/components/card_list.dart';
import 'package:gerenciador_planta/core/http_client.dart';
import 'package:gerenciador_planta/models/planta.dart';
import 'package:gerenciador_planta/screens/form.dart';
import 'package:gerenciador_planta/service/planta_service.dart';
import 'package:gerenciador_planta/utils/header.dart';
import 'package:http/http.dart' as http;
class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  late Future<List<Planta>> _plantasFuture;

  @override
  void initState() {
    super.initState();
    _plantasFuture = _fetch();
  }

  Future<List<Planta>> _fetch() async {
    final http.Client httpClientInstance = http.Client();
    final customHttpClient = HttpClient(httpClientInstance);
    final plantaService = PlantaService(customHttpClient);

    final plantas = await plantaService.fetch();
    return plantas;
  }

  Future<void> _delete(String id) async {
    final http.Client httpClientInstance = http.Client();
    final customHttpClient = HttpClient(httpClientInstance);
    final plantaService = PlantaService(customHttpClient);

    await plantaService.delete(id);
    setState(() {
      _plantasFuture = _fetch();
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
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Scaffold(
            body: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Header.buildTextWithContext(context),
                ),
                Center(child: Text('Nenhuma planta encontrada.')),
              ],
            )            
          );
        } else {
          final plantas = snapshot.data!;

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Header.buildTextWithContext(context),
                  ),
                  Column(
                    children: plantas.map((planta) {
                      return CardList(
                        planta: planta,
                        onUpdate: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormPlanta(planta: planta),
                            ),
                          );

                          setState(() {
                            _plantasFuture = _fetch();
                          });
                        },
                        onDelete: () async {
                          await _delete(planta.id!);
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}