import 'package:flutter/material.dart';
import 'package:material_view/ui/common/util.dart';

class InventoryScreen extends StatelessWidget {
  final Product product;
  const InventoryScreen({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: MyStatefulWidget(product: product),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  final Product product;

  const MyStatefulWidget({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    int numItems = widget.product.stock.length;
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: const Text('Plant Code'),
          ),
          DataColumn(
            label: const Text('Stock DDF'),
          ),
          DataColumn(
            label: const Text('Stock DFC'),
          ),
          DataColumn(
            label: const Text('Stock DED'),
          ),
        ],
        rows: List<DataRow>.generate(
          numItems,
          (int index) => DataRow(
            color: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).colorScheme.primary.withOpacity(0.08);
              }
              
              if (index.isEven) {
                return Colors.grey.withOpacity(0.3);
              }
              return null;
            }),
            cells: <DataCell>[
              DataCell(Text(widget.product.stock[index].plantCode_)),
              DataCell(Text(widget.product.stock[index].stockDDF_)),
              DataCell(Text(widget.product.stock[index].stockDFC_)),
              DataCell(Text(widget.product.stock[index].deletionDDF_))
              ],
          ),
        ),
      ),
    );
  }
}
