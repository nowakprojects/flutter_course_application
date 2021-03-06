import 'package:flutter/material.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/scoped_models/main.dart';
import 'package:flutter_course_application/widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () {
          print('Back button pressed');
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model){
            final product = model.allProducts[productIndex];
            return  Scaffold(
              appBar: AppBar(title: Text('Product Detail')),
              body: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(product.image),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: TitleDefault(title: product.title),
                    ),
                    _buildAddressPriceRow(product),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        product.description,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
            );
          }
        ),
      );

  Row _buildAddressPriceRow(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Union Square, San Francisco',
          style: TextStyle(
            fontFamily: 'Oswald',
            color: Colors.grey,
          ),
        ),
        Container(
          child: Text('|'),
          margin: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        Text(
          '\$' + product.price.toString(),
          style: TextStyle(
            fontFamily: 'Oswald',
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
