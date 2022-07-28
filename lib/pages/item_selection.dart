import 'package:demo_app_2021_04_20/Widgets/item_selection/action_tile_select.dart';
import 'package:demo_app_2021_04_20/data/item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemSelectionArguments {
  final void Function(Item) onAddItem;

  ItemSelectionArguments({this.onAddItem});
}

class ItemSelection extends StatelessWidget {
  static String routeName = '/item-selection';

  final List<Item> itemList = [
    Item(code: 'A20100', itemName: 'Shampoo', unitPrice: 1200.00),
    Item(code: 'A20101', itemName: 'body cream', unitPrice: 800.00),
    Item(code: 'A20102', itemName: 'face cream', unitPrice: 500.00),
    Item(code: 'A20103', itemName: 'face Scrub', unitPrice: 1290.00),
    Item(code: 'A20104', itemName: 'Powder', unitPrice: 600.00),
  ];

  ItemSelection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemSelectionArguments arguments =
        ModalRoute.of(context).settings.arguments as ItemSelectionArguments;

    final onAddItem = arguments.onAddItem;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text(
          "Select Items",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 26,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 20.0, bottom: 20.0, right: 12.0, left: 12.0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: itemList.length,
          itemBuilder: (context, index) => Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 10,
            child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                primary: Colors.white,
              ),
              child:ActionItemSelectionTile(
                code: itemList[index].code,
                itemName: itemList[index].itemName,
                unitPrice: itemList[index].unitPrice.toString(),
              ),
              onPressed: () {
                onAddItem(itemList[index]);
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
    );
  }
}
