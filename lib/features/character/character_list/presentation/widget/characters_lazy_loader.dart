import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/features.dart';
import 'package:rickandmorty/shared/shared.dart';

class CharactersLazyLoading extends StatelessWidget {
  const CharactersLazyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<CharacterListBloc, CharacterListState>(
        buildWhen: (previous, current) {
          return current.status == CharacterListStatus.success;
        },
        builder: (context, state) {
          final hasMore = state.page.$1 <= state.page.$2;

          if (hasMore) {
            return const PortalLoader();
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
