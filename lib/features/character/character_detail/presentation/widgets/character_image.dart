import 'package:flutter/material.dart';
import 'package:rickandmorty/shared/shared.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({
    required this.id,
    required this.url,
    super.key,
  });

  final int id;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Stack(
        children: [
          Image.network(
            url,
            fit: BoxFit.cover,
            height: Layout.setHeight(context, 60),
            width: double.infinity,
          ),
          Container(
            height: Layout.setHeight(context, 60),
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black54,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
