import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_entities/rick_and_morty_entities.dart';
import 'package:rickandmorty/features/features.dart';
import 'package:rickandmorty/shared/shared.dart';

class EpisodesList extends StatefulWidget {
  const EpisodesList({
    required this.requestMore,
    super.key,
  });

  final bool requestMore;

  @override
  State<EpisodesList> createState() => _EpisodesListState();
}

class _EpisodesListState extends State<EpisodesList> {
  @override
  void didUpdateWidget(covariant EpisodesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    final characterBloc = context.read<EpisodeBloc>();
    if (widget.requestMore) {
      characterBloc.add(
        EpisodeListRequested(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodeBloc, EpisodeState>(
      builder: (context, state) {
        if (state.episodes.isEmpty) {
          return const SliverFillRemaining(
            child: Center(
              child: PortalLoader(),
            ),
          );
        } else {
          final characters = state.episodes;

          return SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30,
            ),
            sliver: SliverList.separated(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final item = characters[index];

                return _EpisodeItem(item: item);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 15);
              },
            ),
          );
        }
      },
    );
  }
}

class _EpisodeItem extends StatelessWidget {
  const _EpisodeItem({
    required this.item,
  });

  final EpisodeModel item;

  (String, Color) getColorBySeason(String episode) {
    final season = episode.split('E')[0];
    final seasonNumber = int.parse(season.split('').last);
    final color = Colors.primaries[seasonNumber % Colors.primaries.length];
    return (season, color);
  }

  @override
  Widget build(BuildContext context) {
    final season = getColorBySeason(item.episode);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: season.$2,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              season.$1,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  item.episode,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Air date: ${item.episode}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
