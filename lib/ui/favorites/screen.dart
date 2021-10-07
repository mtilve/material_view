import 'package:flutter/material.dart';
import 'package:material_view/ui/common/util.dart';
import 'package:material_view/ui/main/screen.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  State<FavoritesScreen> createState() => _FavoritesfulWidgetState();
}

class _FavoritesfulWidgetState extends State<FavoritesScreen> {
  void _addFavorite(String id, bool alreadySaved) {
    Store store = Store();
    if (alreadySaved) {
      store.remove(id);
    } else {
      store.add(id);
    }
    setState(() {});
  }

  Future<bool> _onBackPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Store store = Store();
    var favorites = store.getStore();
    var products = store.getProducts(favorites);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(height: 0),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final _product = products[index];
                    var alreadySaved = store.isFavorite(_product.productID);
                    return ListTile(
                        leading: Image(image: AssetImage(_product.image)),
                        title: Text(_product.name),
                        subtitle: Text(_product.productID),
                        trailing: Icon(
                            alreadySaved ? Icons.star : Icons.star_border,
                            color: alreadySaved ? Colors.red : null),
                        onTap: () =>
                            _addFavorite(_product.productID, alreadySaved));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
