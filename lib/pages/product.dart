import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () {
        print('Back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(title: Text('Product Detail')),
          body: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(imageUrl),
                Container(padding: EdgeInsets.all(10.0), child: Text(title)),
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text('DELETE'),
                        onPressed: () {
                          showDialog(context: context, builder: _buildDialog());
                          //Navigator.pop(context, true))
                        }))
              ])));

  _buildDialog() => (BuildContext context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('This action connot be undone!'),
        actions: [
          FlatButton(
              child: Text('DISCARD'),
              onPressed: () {
                Navigator.pop(context);
              }),
          FlatButton(
              child: Text('CONTINUE'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              })
        ],
      );
}
