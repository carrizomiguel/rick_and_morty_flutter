class DefaultModel {
  const DefaultModel({
    required this.name,
    required this.url,
  });

  factory DefaultModel.fromJson(Map<String, dynamic> json) {
    return DefaultModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
  final String name;
  final String url;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
