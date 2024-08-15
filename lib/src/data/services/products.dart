import 'dart:developer';

import 'package:medusa_store_flutter/medusa_store.dart';
import 'package:medusa_store_flutter/src/data/models/response/attributes.dart';

import 'base.dart';

class ProductsResource extends BaseResource {
  ProductsResource(super.client);

  /// @description Retrieves a list of products
  /// @param {StoreGetProductsParams} query is optional. Can contain a limit and offset for the returned list
  /// @param customHeaders
  /// @return {ResponsePromise<StoreProductsListRes>}
  Future<StoreProductsListRes?> list(
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/products',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return StoreProductsListRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// @description Retrieves a single Product
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreProductsRes>}
  Future<StoreProductsRes?> retrieve(String id,
      {Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/products/$id',
      );
      if (response.statusCode == 200) {
        return StoreProductsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Customer?> getWishlist({Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }

      final response = await client.get(
        '/store/customers/me',
      );
      if (response.statusCode == 200) {
        return Customer.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Customer?> addWishlist(
      {required String variantID,
      required String customerID,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }

      final data = {
        "variant_id": variantID,
        "quantity": 1,
      };

      final response = await client.post(
        '/store/customers/$customerID/wishlist',
        data: data,
      );
      if (response.statusCode == 200) {
        return Customer.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Customer?> removeWishlist(
      {required int index,
      required String customerID,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }

      final data = {
        "index": index,
      };

      final response = await client.delete(
        '/store/customers/$customerID/wishlist',
        data: data,
      );
      if (response.statusCode == 200) {
        return Customer.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Uses https://github.com/vholik/medusa-custom-attributes

  Future<List<Attributes>> getAttributes(
      {Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }

      final response = await client.get(
        '/store/attributes',
      );

      if (response.statusCode == 200) {
        final List<Attributes> attributes = [];
        response.data.forEach((attribute) {
          attributes.add(Attributes.fromJson(attribute));
        });
        return attributes;
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// @description Searches for products
  /// @param {StorePostSearchReq} searchOptions is required
  /// @param customHeaders
  /// @return {ResponsePromise<StorePostSearchRes>}
  Future<StorePostSearchRes?> search(
      {StoreGetSearchReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }

      if (req == null) {
        return null;
      }

      var pageSize = req.limit ?? 15;

      var queries = [];

      var offset = req.offset;

      final categories = req.categories;
      if (categories != null) {
        queries.add("categories.handle IN [${categories.join(', ')}]");
      }

      if (req.minPrice != null) {
        queries.add(
            "(variants.prices.amount >= ${req.minPrice} AND variants.prices.currency_code = \"${req.currencyCode}\")");
      }

      if (req.maxPrice != null) {
        queries.add(
            "(variants.prices.amount <= ${req.maxPrice} AND variants.prices.currency_code = \"${req.currencyCode}\")");
      }

      req.attributesToHighlight = ["*"];
      req.highlightPreTag = "__ais-highlight__";
      req.highlightPostTag = "__/ais-highlight__";

      StorePostSearchReq searchRes = StorePostSearchReq(
          q: req.q,
          offset: offset,
          sort: req.orderBy != null ? ["${req.orderBy}:${req.order}"] : [],
          limit: pageSize,
          attributesToHighlight: req.attributesToHighlight,
          highlightPreTag: req.highlightPreTag,
          highlightPostTag: req.highlightPostTag,
          filter: queries.join(' AND '));

      log(searchRes.toJson().toString());

      final response =
          await client.post('/store/products/search', data: searchRes);
      if (response.statusCode == 200) {
        return StorePostSearchRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
}
