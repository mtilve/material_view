import 'package:flutter/material.dart';
import 'package:material_view/ui/common/util.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                leading: Icon(Icons.source),
                title: Text('Product Id'),
                subtitle: Text(product.productID),
              ),              
              ListTile(
                leading: Icon(Icons.description),
                title: Text('Description'),
                subtitle: Text(product.category),
              ),
              ListTile(
                leading: Icon(Icons.article_sharp),
                title: Text('Extra Description'),
                subtitle: Text(product.categoryName),
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text('Type'),
                subtitle: Text(product.currencyCode),
              ),
              ListTile(
                leading: Icon(Icons.agriculture),
                title: Text('Primary Usage'),
                subtitle: Text(product.dimensionUnit),
              ),
              ListTile(
                leading: Icon(Icons.delivery_dining),
                title: Text('Supplier Id'),
                subtitle: Text(product.supplierID),
              ),
              ListTile(
                leading: Icon(Icons.perm_device_information),
                title: Text('Long Description'),
                subtitle: Text(product.longDescription),
              ),
            ],
          ).toList(),
          
        ));
  }
}
