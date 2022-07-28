import 'package:demo_app_2021_04_20/Widgets/invoice/display_invoice_tile.dart';
import 'package:demo_app_2021_04_20/data/cart.dart';
import 'package:demo_app_2021_04_20/data/invoice_detail.dart';
import 'package:demo_app_2021_04_20/pages/item_selection.dart';
import 'package:demo_app_2021_04_20/pages/payments.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Invoice extends StatefulWidget {
  static String routeName = '/invoice';

  Invoice({Key key}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    Cart itemsCart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text(
          "Invoice",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Flexible(
          child: ListView.builder(
            //scrollDirection: Axis.vertical,
            itemCount: itemsCart.itemsInInvoice.length,

            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),

            itemBuilder: (context, index) => Dismissible(
              direction: DismissDirection.endToStart,
              key: ObjectKey(itemsCart.itemsInInvoice[index]),
              onDismissed: (direction) {
                itemsCart.deleteItem(index);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: DisplayInvoiceTile(
                  invoiceDetail: itemsCart.itemsInInvoice[index],
                  onIncrement: () => itemsCart.incrementQty(index),
                  onDecrement: () => itemsCart.decrementQty(index),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Container(
          height: 110.0,
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        itemsCart.total.toString(),
                        style: GoogleFonts.lato(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Payments.routeName);
                  },
                  child: Text(
                    'CheckOut',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: Colors.deepPurple[800],
        child: Icon(
          Icons.add_shopping_cart,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pushNamed(
          ItemSelection.routeName,
          arguments: ItemSelectionArguments(
            onAddItem: (item) => itemsCart.addItem(InvoiceDetail(item: item)),
          ),
        ),
      ),
    );
  }
}
