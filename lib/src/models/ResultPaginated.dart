
import 'Pagination.dart';
import 'Product.dart';

class ResultPaginated {
  Pagination pagination;
  List<Product> elements;

  ResultPaginated({this.pagination, this.elements});

  ResultPaginated.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['elements'] != null) {
      elements = new List<Product>();
      json['elements'].forEach((v) {
        elements.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    if (this.elements != null) {
      data['elements'] = this.elements.map((v) => v.toJson()).toList();
    }
    return data;
  }
}