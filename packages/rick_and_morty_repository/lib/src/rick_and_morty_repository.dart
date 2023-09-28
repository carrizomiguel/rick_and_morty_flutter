import 'dart:io';

import 'package:oxidized/oxidized.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';
import 'package:rick_and_morty_entities/rick_and_morty_entities.dart';

/// {@template rick_and_morty_repository}
/// Rick And Morty Repository.
/// {@endtemplate}
class RickAndMortyRepository {
  /// {@macro rick_and_morty_repository}
  RickAndMortyRepository({
    RickAndMortyApi? api,
  }) : _api = api ?? RickAndMortyApi();

  final RickAndMortyApi _api;

  Future<Result<(int, List<CharacterModel>), Failure>> getCharacters({
    required int page,
  }) async {
    try {
      final remote = await _api.getCharacters(page: page);
      return Result.ok(remote);
    } on RequestException {
      return Result.err(RequestFailure());
    } on SocketException {
      return Result.err(SocketFailure());
    }
  }

  Future<Result<(int, List<CharacterModel>), Failure>> getCharacterByName({
    required String key,
    required int page,
  }) async {
    try {
      final remote = await _api.getCharacterByName(key: key, page: page);
      return Result.ok(remote);
    } on RequestException {
      return Result.err(RequestFailure());
    } on SocketException {
      return Result.err(SocketFailure());
    }
  }

  Future<Result<(int, List<EpisodeModel>), Failure>> getEpisodes({
    required int page,
  }) async {
    try {
      final remote = await _api.getEpisodes(page: page);
      return Result.ok(remote);
    } on RequestException {
      return Result.err(RequestFailure());
    } on SocketException {
      return Result.err(SocketFailure());
    }
  }
}
