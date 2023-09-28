import 'package:flutter/material.dart';
import 'package:rick_and_morty_entities/rick_and_morty_entities.dart';

class CharacterInformation extends StatelessWidget {
  const CharacterInformation({
    required this.character,
    super.key,
  });

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    final isAlive = character.status == 'Alive';

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                character.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FilterChip(
                  onSelected: (a) {},
                  label: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: isAlive ? Colors.green : Colors.red,
                        radius: 8,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${character.status} - ${character.species}',
                        // style: ,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        _InformationItem(
          title: 'Origin: ',
          value: character.origin.name,
        ),
        const SizedBox(height: 20),
        _InformationItem(
          title: 'Location: ',
          value: character.location.name,
        ),
      ],
    );
  }
}

class _InformationItem extends StatelessWidget {
  const _InformationItem({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.home,
              color: Colors.grey,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
