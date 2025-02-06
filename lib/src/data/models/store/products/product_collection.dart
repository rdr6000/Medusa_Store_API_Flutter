import 'product.dart';

class ProductCollection {
  /// The product collection's id
  ///
  /// Example: "pcol_01F0YESBFAZ0DV6V831JXWH0BG"
  final String? id;

  /// The title that the product collection is identified by.
  ///
  /// Example: "Summer Collection"
  final String? title;

  /// A unique string that identifies the product collection - can for example be used in slug structures.
  ///
  /// Example: "summer-collection"

  final String? handle;

  /// The details of the products that belong to this product collection.
  final List<Product>? products;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  final String? thumbnail;
  final int? displayVisibility;
  final int? rank;
  final bool? isFeatured;
  final bool? isActive;
  final List<String>? images;

  ProductCollection({
    this.id,
    required this.title,
    this.handle,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
    this.thumbnail,
    this.displayVisibility,
    this.rank,
    this.isFeatured,
    this.isActive,
    this.images,
  });

  factory ProductCollection.fromJson(Map<String, dynamic> json) {
    List<Product>? products;
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((e) => products!.add(Product.fromJson(e)));
    }
    List<String>? images;
    if (json['images'] != null) {
      images = List<String>.from(json['images']);
    }
    return ProductCollection(
      id: json['id'],
      title: json['title'],
      handle: json['handle'],
      products: products,
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
      thumbnail: json['thumbnail'],
      displayVisibility: json['displayVisibility'],
      rank: json['rank'],
      isFeatured: json['is_featured'],
      isActive: json['is_active'],
      images: images,
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['handle'] = handle;
    json['products'] = products?.map((e) => e.toJson()).toList();
    json['created_at'] = createdAt?.toIso8601String();
    json['updated_at'] = updatedAt?.toIso8601String();
    json['deleted_at'] = deletedAt?.toIso8601String();
    json['metadata'] = metadata;
    json['thumbnail'] = thumbnail;
    json['displayVisibility'] = displayVisibility;
    json['rank'] = rank;
    json['is_featured'] = isFeatured;
    json['is_active'] = isActive;
    json['images'] = images;
    return json;
  }

  ProductCollection copyWith({
    String? id,
    String? title,
    String? handle,
    List<Product>? products,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    Map<String, dynamic>? metadata,
    String? thumbnail,
    int? displayVisibility,
    int? rank,
    bool? isFeatured,
    bool? isActive,
    List<String>? images,
  }) {
    return ProductCollection(
      id: id ?? this.id,
      title: title ?? this.title,
      handle: handle ?? this.handle,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      metadata: metadata ?? this.metadata,
      thumbnail: thumbnail ?? this.thumbnail,
      displayVisibility: displayVisibility ?? this.displayVisibility,
      rank: rank ?? this.rank,
      isFeatured: isFeatured ?? this.isFeatured,
      isActive: isActive ?? this.isActive,
      images: images ?? this.images,
    );
  }
}
