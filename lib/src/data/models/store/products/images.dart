class Image {
  final String? id;
  final String? url;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final Map<String, dynamic>? metadata;

  Image({
    this.id,
    this.url,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'],
      url: json['url'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
      'metadata': metadata,
    };
  }
}