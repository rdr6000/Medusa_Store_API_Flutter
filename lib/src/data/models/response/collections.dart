import '../store/products/product_collection.dart';

class StoreCollectionsRes {
  ProductCollection? collection;

  StoreCollectionsRes.fromJson(Map<String, dynamic>? json) {
    collection = json != null ? ProductCollection.fromJson(json) : null;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    if (collection != null) {
      data = collection!.toJson();
    }
    return data;
  }
}

class StoreCollectionsListRes {
  final List<ProductCollection>? collections;
  StoreCollectionsListRes(this.collections);

  factory StoreCollectionsListRes.fromJson(json) {
    if (json != null) {
      var collections = <ProductCollection>[];
      json.forEach((v) {
        collections.add(ProductCollection.fromJson(v));
      });
      return StoreCollectionsListRes(collections);
    }
    return StoreCollectionsListRes(null);
  }

  Map<String, dynamic>? toJson() {
    if (collections == null) {
      return null;
    }
    return {
      'collections': collections!.map((e) => e.toJson()).toList(),
    };
  }
}
