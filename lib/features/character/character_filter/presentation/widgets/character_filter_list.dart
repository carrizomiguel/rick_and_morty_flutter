import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_entities/rick_and_morty_entities.dart';
import 'package:rickandmorty/features/features.dart';
import 'package:rickandmorty/shared/shared.dart';

class CharacterFilterList extends StatefulWidget {
  const CharacterFilterList({
    required this.requestMore,
    super.key,
  });

  final bool requestMore;

  @override
  State<CharacterFilterList> createState() => _CharacterFilterListState();
}

class _CharacterFilterListState extends State<CharacterFilterList> {
  @override
  void didUpdateWidget(covariant CharacterFilterList oldWidget) {
    super.didUpdateWidget(oldWidget);
    final characterFilterBloc = context.read<CharacterFilterBloc>();
    if (widget.requestMore) {
      characterFilterBloc.add(
        CharacterFilterRequested(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterFilterBloc, CharacterFilterState>(
      builder: (context, state) {
        switch (state.status) {
          case CharacterFilterStatus.initial:
            return const SliverToBoxAdapter(
              child: SizedBox.shrink(),
            );
          case CharacterFilterStatus.loading:
            return const SliverFillRemaining(
              child: Center(
                child: PortalLoader(),
              ),
            );
          case CharacterFilterStatus.success:
            final characters = state.characters;

            return SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisExtent: Layout.setHeight(context, 32),
                ),
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final item = characters[index];

                  return _CharacterItem(item: item);
                },
              ),
            );
          case CharacterFilterStatus.error:
            return const SliverToBoxAdapter(
              child: SizedBox.shrink(),
            );
        }
      },
    );
  }
}

class _CharacterItem extends StatelessWidget {
  const _CharacterItem({
    required this.item,
  });

  final CharacterModel item;

  @override
  Widget build(BuildContext context) {
    final isAlive = item.status == 'Alive';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (context) => CharacterPage(
              character: item,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: Layout.setHeight(context, 13),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 16,
                  color: Colors.black12,
                  offset: Offset(4, 0),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                15,
                Layout.setHeight(context, 8),
                15,
                15,
              ),
              child: Column(
                children: [
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: isAlive ? Colors.green : Colors.red,
                        radius: 5,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        item.status,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            bottom: null,
            child: Hero(
              tag: item.id,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.grey.shade400,
                backgroundImage: NetworkImage(
                  item.image,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
