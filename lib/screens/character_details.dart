import 'package:flutter/material.dart';

import '../models/character_model.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({
    super.key,
    required this.characterModel,
  });

  final CharacterModel characterModel;

  @override
  State<CharacterDetailsPage> createState() =>
      _CharacterDetailsPageState();
}

class _CharacterDetailsPageState
    extends State<CharacterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(
              widget.characterModel.image,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Nome"),
                    subtitle: Text(
                      widget.characterModel.name,
                    ),
                  ),

                  ListTile(
                    title: const Text("Status"),
                    subtitle: Text(
                      widget.characterModel.status,
                    ),
                  ),

                  ListTile(
                    title: const Text("Espécie"),
                    subtitle: Text(
                      widget.characterModel.species,
                    ),
                  ),

                  ListTile(
                    title: const Text("Gênero"),
                    subtitle: Text(
                      widget.characterModel.gender,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}