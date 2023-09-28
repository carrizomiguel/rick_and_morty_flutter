import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_entities/rick_and_morty_entities.dart';
import 'package:rick_and_morty_repository/rick_and_morty_repository.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  EpisodeBloc({
    required this.repository,
  }) : super(const EpisodeState()) {
    on<EpisodeListRequested>(_onListRequested);
  }

  final RickAndMortyRepository repository;

  Future<void> _onListRequested(
    EpisodeListRequested event,
    Emitter<EpisodeState> emit,
  ) async {
    final page = state.page;

    if (page.$1 > page.$2) return;

    emit(
      state.copyWith(
        status: EpisodeStatus.loading,
      ),
    );
    final result = await repository.getEpisodes(
      page: page.$1,
    );
    result.when(
      ok: (response) {
        final episodes = state.episodes;

        emit(
          state.copyWith(
            status: EpisodeStatus.success,
            episodes: [...episodes, ...response.$2],
            page: (page.$1 + 1, response.$1),
          ),
        );
      },
      err: (_) {
        emit(
          state.copyWith(
            status: EpisodeStatus.error,
          ),
        );
      },
    );
  }
}
