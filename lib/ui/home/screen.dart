import 'package:flutter/material.dart';
import 'package:material_view/ui/common/util.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  final Product product;
  const HomeScreen({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomefulWidgetState();
}

class _HomefulWidgetState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.productID + " - " + widget.product.name),
        centerTitle: true,
      ),
      body: Center(child: buildCard(widget.product)),
    );
  }

  void _addFavorite(String id, bool alreadySaved) {
    Store store = Store();
    if (alreadySaved) {
      store.remove(id);
    } else {
      store.add(id);
    }
    setState(() {});
  }

  Card buildCard(Product product) {
    var heading = product.name;
    var subheading = product.shortDescription;
    var cardImage = NetworkImage(product.image);

    Store store = Store();
    bool alreadySaved =
        store.getStore().any((element) => element == product.productID);

    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              subtitle: Text(subheading),
              trailing: Icon(alreadySaved ? Icons.star : Icons.star_border,
                  color: alreadySaved ? Colors.red : null),
              onTap: () => _addFavorite(product.productID, alreadySaved),
            ),
            Container(
              height: 200.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.fitHeight,
              ),
            ),
            Divider(),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  icon: Icon(Icons.add_shopping_cart),
                  label: const Text('REPORT STOCK'),
                  onPressed: () {/* ... */},
                ),
                TextButton.icon(
                  icon: Icon(Icons.send),
                  label: const Text('SEND NOTIFICATION'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: QrImage(
                data: product.productID,
                version: QrVersions.auto,
                size: 100.0,
              ),
            ),
          ],
        ));
  }
}
