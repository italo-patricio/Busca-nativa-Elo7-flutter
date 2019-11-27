import 'ResultPaginated.dart';

class PaginatedProductsResult {
  ResultPaginated result;

  PaginatedProductsResult({this.result});

  PaginatedProductsResult.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new ResultPaginated.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

