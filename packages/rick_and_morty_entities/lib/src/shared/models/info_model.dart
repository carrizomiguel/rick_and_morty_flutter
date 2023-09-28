class InfoModel {
  const InfoModel({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      count: json['count'] as int,
      pages: json['pages'] as int,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );
  }

  final int count;
  final int pages;
  final String? next;
  final String? prev;

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }
}
