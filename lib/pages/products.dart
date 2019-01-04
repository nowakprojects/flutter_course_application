import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';
import 'package:flutter_course_application/scoped_models/main.dart';
import 'package:flutter_course_application/widgets/products/products.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: _buildNavigationDrawer(context),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon: Icon(model.isShowFavoritesDisplayMode
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  model.toggleDisplayMode();
                },
              );
            },
          )
        ],
      ),
      body: Products());

  Widget _buildNavigationDrawer(BuildContext context) {
    return Drawer(
        child: Column(children: [
      AppBar(title: Text('Choose'), automaticallyImplyLeading: false),
      ListTile(
          leading: Icon(Icons.edit),
          title: Text('Manage Products'),
          onTap: () => _navigateToProductsAdminPage(context))
    ]));
  }

  void _navigateToProductsAdminPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.ADMIN);
  }
}
