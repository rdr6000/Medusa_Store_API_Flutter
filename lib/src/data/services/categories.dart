import 'dart:developer';
import '../models/response/index.dart';
import 'base.dart';

class CategoriesResource extends BaseResource {
  CategoriesResource(super.client);

  /// @description Retrieves a single collection
  /// @param {string} id id of the collection
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCategoriesRes>}
  Future<StoreCategoryRes?> retrieve(
      {required String id, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get('/store/product-categories/$id');
      if (response.statusCode == 200) {
        return StoreCategoryRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// @description Retrieves a list of collections
  /// @param {string} query is optional. Can contain a limit and offset for the returned list
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCategoriesListRes>}
  Future<StoreCategoryListRes?> list(
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/product-categories',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return StoreCategoryListRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
}
