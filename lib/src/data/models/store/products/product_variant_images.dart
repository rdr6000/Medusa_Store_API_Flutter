

class ProductVariantImages {
  /// The product variant image's id
  ///
  /// Example: "img_01J820G10XZD5422KYSES5P5KY"
  final String? id;

  /// The url of the image in String.
  ///
  /// Example: "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  final String? url;

  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  ProductVariantImages({
    this.id,
    required this.url,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory ProductVariantImages.fromJson(Map<String, dynamic> json) {
    return ProductVariantImages(
      id: json['id'],
      url: json['url'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['url'] = url;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
