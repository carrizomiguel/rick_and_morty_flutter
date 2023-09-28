part of 'character_filter_bloc.dart';

sealed class CharacterFilterEvent extends Equatable {
  const CharacterFilterEvent();

  @override
  List<Object> get props => [];
}

class CharacterFilterSearch extends CharacterFilterEvent {
  const CharacterFilterSearch({
    required this.key,
  });

  final String key;
}

class CharacterFilterRequested extends CharacterFilterEvent {}
