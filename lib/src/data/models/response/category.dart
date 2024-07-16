
import '../store/products/product_category.dart';

class StoreCategoryRes {
  ProductCategory? category;

  StoreCategoryRes.fromJson(Map<String, dynamic> json) {
    category = json['product_categories'] != null
        ? ProductCategory.fromJson(json["product_categories"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['product_categories'] = category?.toJson();
    }
    return data;
  }
}

class StoreCategoryListRes {
  final List<ProductCategory>? category;
  StoreCategoryListRes(this.category);

  factory StoreCategoryListRes.fromJson(json) {
    if (json['product_categories'] != null) {
      var category = <ProductCategory>[];
      json['product_categories'].forEach((v) {
        category.add(ProductCategory.fromJson(v));
      });
      return StoreCategoryListRes(category);
    }
    return StoreCategoryListRes(null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_categories'] = category?.map((e) => e.toJson()).toList();
    return data;
  }
}
