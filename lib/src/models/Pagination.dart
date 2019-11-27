
class Pagination {
  int totalNumElements;
  bool hasNext;

  Pagination({this.totalNumElements, this.hasNext});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalNumElements = json['totalNumElements'];
    hasNext = json['hasNext'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalNumElements'] = this.totalNumElements;
    data['hasNext'] = this.hasNext;
    return data;
  }
}
