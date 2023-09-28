import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_entities/rick_and_morty_entities.dart';
import 'package:rick_and_morty_repository/rick_and_morty_repository.dart';

part 'character_filter_event.dart';
part 'character_filter_state.dart';

class CharacterFilterBloc
    extends Bloc<CharacterFilterEvent, CharacterFilterState> {
  CharacterFilterBloc({
    required this.repository,
  }) : super(const CharacterFilterState()) {
    on<CharacterFilterSearch>(_onSearch);
    on<CharacterFilterRequested>(_onRequested);
  }

  final RickAndMortyRepository repository;

  Future<void> _onSearch(
    CharacterFilterSearch event,
    Emitter<CharacterFilterState> emit,
  ) async {
    final page = state.page;

    emit(
      state.copyWith(
        status: CharacterFilterStatus.loading,
        key: event.key,
      ),
    );
    final result = await repository.getCharacterByName(
      key: event.key,
      page: 1,
    );
    result.when(
      ok: (response) {
        emit(
          state.copyWith(
            status: CharacterFilterStatus.success,
            characters: response.$2,
            page: (page.$1 + 1, response.$1),
          ),
        );
      },
      err: (_) {
        emit(
          state.copyWith(
            status: CharacterFilterStatus.error,
          ),
        );
      },
    );
  }

  Future<void> _onRequested(
    CharacterFilterRequested event,
    Emitter<CharacterFilterState> emit,
  ) async {
    final page = state.page;

    if (page.$1 > page.$2) return;

    emit(
      state.copyWith(
        status: CharacterFilterStatus.loading,
      ),
    );
    final result = await repository.getCharacterByName(
      key: state.key,
      page: page.$1,
    );
    result.when(
      ok: (response) {
        final characters = state.characters;

        emit(
          state.copyWith(
            status: CharacterFilterStatus.success,
            characters: [...characters, ...response.$2],
            page: (page.$1 + 1, response.$1),
          ),
        );
      },
      err: (_) {
        emit(
          state.copyWith(
            status: CharacterFilterStatus.error,
          ),
        );
      },
    );
  }
}
