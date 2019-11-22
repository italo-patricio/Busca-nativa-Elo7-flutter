import 'package:elo7_desafio/src/models/Product.dart';
import 'package:elo7_desafio/src/pages/WebViewPage.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;


  ProductWidget(this.product) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute<Null>(builder: (BuildContext context) {
              return  WebViewPage(product.link);
            }));
      },
      child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Image.network(
                product?.picture,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Wrap(children: <Widget>[
              Text(
                product.title[0].toUpperCase() + product.title.substring(1).toLowerCase(),
                style: TextStyle(
                  color: Color(0xff00A6A5),
                  fontSize: 15,
                ),
              ),
            ]),

          SizedBox(height: 2,),
            Row(
              children: <Widget>[
                Text(
                  '${product.price?.current}',
                  style: TextStyle(
                    color: Color(0xffF8722B),
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                product.price.nonPromotional != null ?
                Text(
                  product.price.nonPromotional,
                  style: TextStyle(
                    color: Color(0xffBCBAB7),
                    decoration: TextDecoration.lineThrough,
                    fontSize: 15,
                  ),
                ) : Container(),

              ],
            ),

            SizedBox(height: 2,),
            product.price.installment != null ?
            Text(
              product.price?.installment,
              style: TextStyle(
                color: Color(0xff76767C),
                fontSize: 13,
              ),
            ) : Container()
          ],
        ),
      ),
    );
  }
}
