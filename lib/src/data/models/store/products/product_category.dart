import 'product.dart';

class ProductCategory {
  /// The product category's id
  ///
  /// Example: "pcat_01G2SG30J8C85S4A5CHM2S1NS2"
  final String? id;

  /// Example: "Regular Fit"
  /// The product category's name
  final String? name;

  /// A unique string that identifies the product category - can for example be used in slug structures.
  ///
  /// Example: "regular-fit"
  final String? handle;

  /// A string for materialized paths - used for finding ancestors and descendants
  ///
  /// Example: "pcat_id1.pcat_id2.pcat_id3"
  final String? mPath;

  /// A flag to make product category an internal category for admins
  ///
  /// Default: false
  final bool? isInternal;

  /// A flag to make product category visible/hidden in the store front
  ///
  /// Default: false
  final bool? isActive;

  // categoryChildren

  /// The id of the parent category.
  final String? parentCategoryId;

  /// An integer that depicts the rank of category in a tree node
  ///
  /// Default: 0
  final int? rank;

  /// The details of the parent of this category.
  final ProductCategory? parentCategory;

  /// The details of the products that belong to this category.
  final List<Product>? products;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;
  final String? thumbnail;
  final int? displayVisibility;

  ProductCategory({
    this.id,
    this.name,
    this.handle,
    this.mPath,
    this.isInternal,
    this.isActive,
    this.parentCategoryId,
    this.rank,
    this.parentCategory,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.thumbnail,
    this.displayVisibility,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    List<Product>? products;
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((e) => products!.add(Product.fromJson(e)));
    }

    return ProductCategory(
      id: json['id'],
      name: json['name'],
      handle: json['handle'],
      mPath: json['mpath'],
      isInternal: json['is_internal'],
      isActive: json['is_active'],
      parentCategoryId: json['parent_category_id'],
      rank: json['rank'],
      parentCategory: json['parent_category'] != null ? ProductCategory.fromJson(json['parent_category']) : null,
      products: products,
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      thumbnail: json['thumbnail'],
      displayVisibility: json['displayVisibility'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['handle'] = handle;
    json['mpath'] = mPath;
    json['is_internal'] = isInternal;
    json['is_active'] = isActive;
    json['parent_category_id'] = parentCategoryId;
    json['rank'] = rank;
    json['parent_category'] = parentCategory?.toJson();
    json['products'] = products?.map((e) => e.toJson()).toList();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['thumbnail'] = thumbnail;
    json['displayVisibility'] = displayVisibility;
    return json;
  }
}
