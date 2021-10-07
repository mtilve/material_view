import 'package:flutter/material.dart';
import 'package:material_view/ui/common/util.dart';
import 'package:material_view/ui/details/screen.dart';
import 'package:material_view/ui/favorites/screen.dart';
import 'package:material_view/ui/home/screen.dart';
import 'package:material_view/ui/inventory/screen.dart';

class TabHome extends StatefulWidget {
  final Product product;

  const TabHome({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  int _currentIndex = 0;
  Product _currentProduct;
  @override
  Widget build(BuildContext context) {
    _currentProduct = widget.product;
    return LayoutBuilder(
      builder: (context, dimens) {
        return Scaffold(
          body: buildBody(),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: _onTap,
            items: [
              BottomNavigationBarItem(
                label: 'Manufacturer',
                icon: Icon(Icons.business_center),
              ),
              BottomNavigationBarItem(
                label: 'Details',
                icon: Icon(Icons.manage_search),
              ),
              BottomNavigationBarItem(
                label: 'Inventory',
                icon: Icon(Icons.build),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onTap(int val) {
    if (mounted)
      setState(() {
        _currentIndex = val;
      });
  }

  IndexedStack buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        HomeScreen(product: _currentProduct),
        DetailsScreen(product: _currentProduct),
        InventoryScreen(product: _currentProduct),
        FavoritesScreen(),
      ],
    );
  }
}
