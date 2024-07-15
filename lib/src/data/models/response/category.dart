
import '../store/products/product_category.dart';

class StoreCategoryRes {
  ProductCategory? category;

  StoreCategoryRes.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null ? ProductCategory.fromJson(json["category"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category?.toJson();
    }
    return data;
  }
}

class StoreCategoryListRes {
  final List<ProductCategory>? category;
  StoreCategoryListRes(this.category);

  factory StoreCategoryListRes.fromJson(json) {
    if (json['category'] != null) {
      var category = <ProductCategory>[];
      json['category'].forEach((v) {
        category.add(ProductCategory.fromJson(v));
      });
      return StoreCategoryListRes(category);
    }
    return StoreCategoryListRes(null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category?.map((e) => e.toJson()).toList();
    return data;
  }
}
