class EpisodeModel {
  const EpisodeModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'] as int,
      name: json['name'] as String,
      airDate: json['air_date'] as String,
      episode: json['episode'] as String,
      characters: List<String>.from(
        (json['characters'] as List).map((x) => x as String),
      ),
      url: json['url'] as String,
      created: DateTime.parse(
        json['created'] as String,
      ),
    );
  }

  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'air_date': airDate,
      'episode': episode,
      'characters': List<dynamic>.from(
        characters.map((x) => x),
      ),
      'url': url,
      'created': created.toIso8601String(),
    };
  }
}
