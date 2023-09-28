part of 'character_filter_bloc.dart';

enum CharacterFilterStatus {
  initial,
  loading,
  success,
  error,
}

class CharacterFilterState extends Equatable {
  const CharacterFilterState({
    this.status = CharacterFilterStatus.initial,
    this.characters = const [],
    this.page = (1, 1),
    this.key = '',
  });

  final CharacterFilterStatus status;
  final List<CharacterModel> characters;
  // First number is the current page and
  // the second one the number of pages
  final (int, int) page;
  final String key;

  CharacterFilterState copyWith({
    CharacterFilterStatus? status,
    List<CharacterModel>? characters,
    (int, int)? page,
    String? key,
  }) {
    return CharacterFilterState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      page: page ?? this.page,
      key: key ?? this.key,
    );
  }

  @override
  List<Object> get props => [
        status,
        characters,
        page,
        key,
      ];
}
