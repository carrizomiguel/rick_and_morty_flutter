import 'package:flutter/material.dart';
import 'package:rick_and_morty_entities/rick_and_morty_entities.dart';
import 'package:rickandmorty/features/features.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({
    required this.character,
    super.key,
  });

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return CharacterBody(
      character: character,
    );
  }
}

class CharacterBody extends StatelessWidget {
  const CharacterBody({
    required this.character,
    super.key,
  });

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CharacterImage(
                id: character.id,
                url: character.image,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CharacterInformation(
                  character: character,
                ),
              ),
            ],
          ),
          SafeArea(
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
