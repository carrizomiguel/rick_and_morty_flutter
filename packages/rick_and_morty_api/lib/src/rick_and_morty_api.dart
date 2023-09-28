import 'package:dio/dio.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';
import 'package:rick_and_morty_entities/rick_and_morty_entities.dart';

/// {@template rick_and_morty_api}
/// Rick And Morty Api.
/// {@endtemplate}
class RickAndMortyApi {
  /// {@macro rick_and_morty_api}
  RickAndMortyApi({
    Dio? dio,
  }) : _dio = dio ?? Dio();

  final Dio _dio;

  Future<(int, List<CharacterModel>)> getCharacters({
    required int page,
  }) async {
    try {
      final response = await ApiMethod.get(
        dio: _dio,
        uri: Uri.https(
          Endpoints.authority,
          Endpoints.charactersPath(),
          {'page': page.toString()},
        ).toString(),
      );

      final pages = InfoModel.fromJson(
        response['info'] as Map<String, dynamic>,
      ).pages;

      final characters = List<CharacterModel>.from(
        (response['results'] as List<dynamic>).map(
          (x) => CharacterModel.fromJson(
            x as Map<String, dynamic>,
          ),
        ),
      );

      return (pages, characters);
    } catch (e) {
      rethrow;
    }
  }

  Future<(int, List<CharacterModel>)> getCharacterByName({
    required String key,
    required int page,
  }) async {
    try {
      final response = await ApiMethod.get(
        dio: _dio,
        uri: Uri.https(
          Endpoints.authority,
          Endpoints.charactersPath(),
          {
            'page': page.toString(),
            'name': key,
          },
        ).toString(),
      );

      final pages = InfoModel.fromJson(
        response['info'] as Map<String, dynamic>,
      ).pages;

      final characters = List<CharacterModel>.from(
        (response['results'] as List<dynamic>).map(
          (x) => CharacterModel.fromJson(
            x as Map<String, dynamic>,
          ),
        ),
      );

      return (pages, characters);
    } catch (e) {
      rethrow;
    }
  }

  Future<(int, List<EpisodeModel>)> getEpisodes({
    required int page,
  }) async {
    try {
      final response = await ApiMethod.get(
        dio: _dio,
        uri: Uri.https(
          Endpoints.authority,
          Endpoints.episodesPath(),
          {'page': page.toString()},
        ).toString(),
      );

      final pages = InfoModel.fromJson(
        response['info'] as Map<String, dynamic>,
      ).pages;

      final episodes = List<EpisodeModel>.from(
        (response['results'] as List<dynamic>).map(
          (x) => EpisodeModel.fromJson(
            x as Map<String, dynamic>,
          ),
        ),
      );

      return (pages, episodes);
    } catch (e) {
      rethrow;
    }
  }
}
