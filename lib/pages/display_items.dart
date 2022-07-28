import 'package:demo_app_2021_04_20/Widgets/Items/display_item_Tile.dart';
import 'package:demo_app_2021_04_20/data/item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'add_item.dart';

class DisplayItems extends StatelessWidget {
  static String routeName = '/display-items';

  DisplayItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text(
          'Items',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w500,
            fontSize: 28,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: FutureBuilder(
        future: Hive.openBox<Item>(ITEM_BOX_NAME),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Center(child: Text(snapshot.error.toString()));
            else {
              final List<Item> _items = snapshot.data.values.toList();
              return _items.length > 0
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _items.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
                          child: Column(
                            children: [
                              DisplayTileItem(
                                itemCode: _items[index].code,
                                itemName: _items[index].itemName,
                                unitPrice: _items[index].unitPrice,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Text("Empty"),
                    );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 100.0,
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 20.0, bottom: 20.0),
          child: Container(
            child: FloatingActionButton(
              elevation: 10.0,
              backgroundColor: Colors.deepPurple[900],
              child: Icon(
                Icons.add,
                size: 34,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(AddItemPage.routeName);
              },
            ),
          ),
        ),
      ),
    );
  }
}
