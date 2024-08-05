import '../store/products/product.dart';

class StoreProductsListRes {
  final List<Product>? products;
  final int? count;
  final int? limit;
  final int? offset;
  StoreProductsListRes(this.products, {this.count, this.limit, this.offset});
  factory StoreProductsListRes.fromJson(json) {
    if (json['products'] != null) {
      var products = <Product>[];
      json['products'].forEach((v) {
        products.add(Product.fromJson(v));
      });
      return StoreProductsListRes(products, count: json['count'], limit: json['limit'], offset: json['offset']);
    }

    return StoreProductsListRes(null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['products'] = products?.map((e) => e.toJson()).toList();
    return data;
  }
}

class StoreProductsRes {
  Product? product;

  StoreProductsRes.fromJson(json) {
    product = json["product"] != null ? Product.fromJson(json["product"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product?.toJson();
    return data;
  }
}

class StorePostSearchRes {
  List<dynamic>? hits;
  String? query;
  int? processingTimeMs;
  int? limit;
  int? offset;
  int? estimatedTotalHits;

  StorePostSearchRes.fromJson(json) {
    if (json['hits'] != null) {
      hits = json['hits'];
    }
    if (json['query'] != null) {
      query = json['query'];
    }
    if (json['processingTimeMs'] != null) {
      processingTimeMs = json['processingTimeMs'];
    }
    if (json['limit'] != null) {
      limit = json['limit'];
    }
    if (json['offset'] != null) {
      offset = json['offset'];
    }
    if (json['estimatedTotalHits'] != null) {
      estimatedTotalHits = json['estimatedTotalHits'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hits'] = hits;
    data['query'] = query;
    data['processingTimeMs'] = processingTimeMs;
    data['limit'] = limit;
    data['offset'] = offset;
    data['estimatedTotalHits'] = estimatedTotalHits;
    return data;
  }
}
