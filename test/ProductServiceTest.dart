import 'package:elo7_desafio/src/models/PaginatedProductsResult.dart';
import 'package:elo7_desafio/src/services/ProductSearchResult.dart';
import 'package:elo7_desafio/src/services/ProductService.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final service = ProductService();
  group('Produc Service test', () {
    test('Product Service Test Searching empty', () async {
      ProductSearchResult response = await service.search('');

      print(response);

      expect(response, isNotNull);
      expect(response.items.length, greaterThan(1));
    });

    test('Product Service Test Searching with term', () async {
      ProductSearchResult response = await service.search('boneca');

      print(response);

      expect(response, isNotNull);
      expect(response.items.length, greaterThan(1));
    });


    test('Product Service Test Loading paginated ', () async {
      PaginatedProductsResult response = await service.loadPaginated();

      print(response);

      expect(response, isNotNull);
      expect(response.result.pagination.totalNumElements, 41256);
      expect(response.result.elements.length, greaterThan(1));
    });



  });
}
