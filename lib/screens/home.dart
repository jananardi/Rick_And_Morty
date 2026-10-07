import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/character_controller.dart';
import 'character_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = ListCharacterController.listCharacter;

  String pesquisa = '';
  String statusSelecionado = 'Todos';

  @override
  void initState() {
    super.initState();
    controller.listCharacterAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Obx(
            () => controller.isLoading.value
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Column(
          children: [
            // PESQUISA + FILTRO
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Pesquisar personagem',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (valor) {
                        setState(() {
                          pesquisa = valor;
                        });
                      },
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: DropdownButtonFormField<String>(
                      value: statusSelecionado,
                      decoration: const InputDecoration(
                        labelText: 'Status',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Todos',
                          child: Text('Todos'),
                        ),
                        DropdownMenuItem(
                          value: 'Alive',
                          child: Text('Vivo'),
                        ),
                        DropdownMenuItem(
                          value: 'Dead',
                          child: Text('Morto'),
                        ),
                        DropdownMenuItem(
                          value: 'unknown',
                          child: Text('Não identificado'),
                        ),
                      ],
                      onChanged: (valor) {
                        setState(() {
                          statusSelecionado = valor!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // LISTA
            Expanded(
              child: Builder(
                builder: (context) {
                  var personagens = controller.listCharacterObs
                      .where(
                        (character) => character.name
                        .toLowerCase()
                        .contains(
                      pesquisa.toLowerCase(),
                    ),
                  )
                      .where(
                        (character) =>
                    statusSelecionado == 'Todos' ||
                        character.status ==
                            statusSelecionado,
                  )
                      .toList();

                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: personagens.length,
                    itemBuilder:
                        (BuildContext context, int index) {
                      var character = personagens[index];

                      return Card(
                        child: ListTile(
                          onTap: () {
                            Get.to(
                                  () => CharacterDetailsPage(
                                characterModel: character,
                              ),
                            );
                          },

                          leading: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(8),
                            child: Image.network(
                              character.image,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),

                          title: Text(character.name),

                          subtitle: Text(
                            character.species,
                          ),

                          trailing: const Icon(
                            Icons.chevron_right,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}