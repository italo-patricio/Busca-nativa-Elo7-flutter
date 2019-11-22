import 'Price.dart';

class Product {
  String id;
  String title;
  String picture;
  Price price;
  String link;

  Product({this.link, this.id, this.picture, this.price, this.title});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      picture: json['picture'],
      price: json['price'] != null ? Price.fromJson(json['price']) : null,
      link: json['_link'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_link'] = this.link;
    data['id'] = this.id;
    data['picture'] = this.picture;
    data['title'] = this.title;
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    return data;
  }
}
