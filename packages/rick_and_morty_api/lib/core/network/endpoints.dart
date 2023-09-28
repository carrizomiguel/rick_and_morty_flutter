class Endpoints {
  static String authority = 'rickandmortyapi.com';

  static String charactersPath([String id = '']) => '/api/character/$id';

  static String episodesPath([String id = '']) => '/api/episode/$id';
}
