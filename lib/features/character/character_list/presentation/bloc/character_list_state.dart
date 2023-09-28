part of 'character_list_bloc.dart';

enum CharacterListStatus {
  initial,
  loading,
  success,
  error,
}

class CharacterListState extends Equatable {
  const CharacterListState({
    this.status = CharacterListStatus.loading,
    this.characters = const [],
    this.page = (1, 1),
  });

  final CharacterListStatus status;
  final List<CharacterModel> characters;
  // First number is the current page and
  // the second one the number of pages
  final (int, int) page;

  CharacterListState copyWith({
    CharacterListStatus? status,
    List<CharacterModel>? characters,
    (int, int)? page,
  }) {
    return CharacterListState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [
        status,
        characters,
        page,
      ];
}
