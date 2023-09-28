import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_entities/rick_and_morty_entities.dart';
import 'package:rick_and_morty_repository/rick_and_morty_repository.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  CharacterListBloc({
    required this.repository,
  }) : super(const CharacterListState()) {
    on<CharacterListRequested>(_onRequested);
  }

  final RickAndMortyRepository repository;

  Future<void> _onRequested(
    CharacterListRequested event,
    Emitter<CharacterListState> emit,
  ) async {
    final page = state.page;

    if (page.$1 > page.$2) return;

    emit(
      state.copyWith(
        status: CharacterListStatus.loading,
      ),
    );
    final result = await repository.getCharacters(
      page: page.$1,
    );
    result.when(
      ok: (response) {
        final characters = state.characters;

        emit(
          state.copyWith(
            status: CharacterListStatus.success,
            characters: [...characters, ...response.$2],
            page: (page.$1 + 1, response.$1),
          ),
        );
      },
      err: (_) {
        emit(
          state.copyWith(
            status: CharacterListStatus.error,
          ),
        );
      },
    );
  }
}
