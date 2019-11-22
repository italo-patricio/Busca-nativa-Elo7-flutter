import 'package:elo7_desafio/src/models/Product.dart';

class ProductSearchResult {
  int totalCount;
  List<Product> items;

  ProductSearchResult({this.totalCount, this.items});

  ProductSearchResult.fromJson(List json) {
    totalCount = json.length;
    if (json != null) {
      items = new List<Product>();
      json.forEach((v) {
        items.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
