import 'package:demo_app_2021_04_20/data/invoice_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayInvoiceTile extends StatelessWidget {
  final InvoiceDetail invoiceDetail;

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const DisplayInvoiceTile(
      {Key key,
      @required this.invoiceDetail,
      @required this.onIncrement,
      @required this.onDecrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: ListTile(
          title: Row(
            children: [
              Container(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 8.0, bottom: 2.0, right: 8.0),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      invoiceDetail.item.itemName,
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.deepPurple[900],
                                          fontSize: 26,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                    width: 340.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          invoiceDetail.item.unitPrice
                                              .toString(),
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: Colors.purple[900],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          invoiceDetail.lineTotal.toString(),
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.purple[900],
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  width: 150.0,
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(
                                      child: Icon(
                                        Icons.remove,
                                      ),
                                      backgroundColor: Colors.deepPurple[800],
                                      elevation: 8,
                                      onPressed: onDecrement,
                                    ),
                                  ),
                                  width: 60.0,
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      invoiceDetail.itemQty.toString(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          color: Colors.purple[900],
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  width: 80.0,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(
                                      elevation: 8.0,
                                      backgroundColor: Colors.deepPurple[800],
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      onPressed: onIncrement,
                                    ),
                                  ),
                                  width: 60.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
