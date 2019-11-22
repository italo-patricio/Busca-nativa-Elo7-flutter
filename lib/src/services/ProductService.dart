import 'package:elo7_desafio/src/core/Api.dart';

import 'ProductSearchResult.dart';

class ProductService {
  Api _api;

  ProductService() {
    this._api = Api();
  }

  Future<ProductSearchResult> search(String termSearch) async {
    print('Searching..${termSearch}');
    final response = await _api.get("/1/products/?q=$termSearch");

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return ProductSearchResult.fromJson(response.data);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

}
