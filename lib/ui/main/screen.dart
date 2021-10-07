import 'package:flutter/material.dart';
import 'package:material_view/ui/common/index.dart';
import 'package:material_view/ui/common/util.dart';
import 'package:material_view/ui/favorites/screen.dart';
import 'package:material_view/ui/tab/screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _products = new Dummy().dummyProductData();
  final _selection = ValueNotifier<Product>(null);
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimens) {
      if (dimens.maxWidth >= kTabletBreakpoint) {
        const kListViewWidth = 300.0;
        return Row(
          children: <Widget>[
            Container(
              width: kListViewWidth,
              child: buildListView((val) {
                _selection.value = val;
              }),
            ),
            VerticalDivider(width: 0),
            Expanded(
                child: ValueListenableBuilder<Product>(
              valueListenable: _selection,
              builder: (context, product, child) {
                if (product == null) {
                  return Scaffold(
                    appBar: AppBar(),
                    body: Center(child: Text('No Material Selected')),
                  );
                }
                return TabHome(product: product);
              },
            ))
          ],
        );
      }
      return buildListView((val) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => TabHome(product: val),
          ),
        );
      });
    });
  }

  void filterSearchResults(String query) {
    var duplicateItems = new Dummy().dummyProductData();
    List<Product> dummySearchList = [];
    List<Product> dummyListData = [];

    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _products.clear();
        _products.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _products.clear();
        _products.addAll(duplicateItems);
      });
    }
  }

  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('TODO'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text(''),
              ],
            ),
          ),
          actions: [
            new TextButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onPressedQR() {
     _showcontent();
  }

  Widget buildListView(ValueChanged<Product> onSelect) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Materials'),
          centerTitle: false,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.star), onPressed: onPressedFavorite),
            IconButton(icon: Icon(Icons.qr_code), onPressed: onPressedQR)
          ]),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(height: 0),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final _product = _products[index];
                  return ListTile(
                    leading: Image(image: AssetImage(_product.image)),
                    title: Text(_product.name),
                    subtitle: Text(_product.productID),
                    onTap: () => onSelect(_product),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressedFavorite() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FavoritesScreen()),
    );
  }
}
