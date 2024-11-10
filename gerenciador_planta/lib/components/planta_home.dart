import 'package:flutter/material.dart';
import 'package:gerenciador_planta/components/card_home.dart';
import 'package:gerenciador_planta/components/grafico.dart';
import 'package:gerenciador_planta/components/titulo_grafico.dart';
import 'package:gerenciador_planta/models/planta.dart';
import 'package:gerenciador_planta/screens/list_screen.dart';

class PlantaHome extends StatelessWidget {
  final List<Planta> plantas;
  final Map<String, int> tipoContagem;
  final Map<String, int> regiaoContagem;
  final VoidCallback refresh;

  const PlantaHome({
    super.key, 
    required this.plantas,
    required this.tipoContagem,
    required this.regiaoContagem,
    required this.refresh
  });

  @override
  Widget build(BuildContext context) {
    final plantasToScrool = plantas.take(4).toList();

    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(240, 22, 22, 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Gerenciador de Plantas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: plantasToScrool.isEmpty
                      ? [
                          CardHome.buildEmpty(),
                          CardHome.buildEmpty(),
                          CardHome.buildEmpty(),
                        ]
                      : plantasToScrool.map((planta) {
                          return CardHome(planta);
                        }).toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    overlayColor: Colors.transparent,
                    foregroundColor: const Color.fromARGB(200, 231, 193, 243),
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListScreen(),
                      ),
                    );
                      
                    refresh();
                  },
                  child: const Text("Ver tudo"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(48, 48, 48, 0.49),
                ),
                width: double.infinity,
                height: 200,
                child: Row(
                  children: [
                    const Expanded(
                      child: TituloGrafico(
                        "Regiões",
                        "Locais onde as plantas cadastradas no sistema estão localizadas.",
                      ),
                    ),
                    Expanded(
                      child: Grafico(regiaoContagem),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(48, 48, 48, 0.49),
                ),
                width: double.infinity,
                height: 200,
                child: Row(
                  children: [
                    Expanded(
                      child: Grafico(tipoContagem),
                    ),
                    const Expanded(
                      child: TituloGrafico(
                        "Tipos de plantas",
                        "Tipos de plantas que estão cadastradas no sistema.",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
