import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPayment extends StatefulWidget {
  static String routeName = '/card-payment';
  CardPayment({Key key}) : super(key: key);

  @override
  _CardPaymentState createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  List<String> _card = ['A', 'B', 'C', 'D'];
  String _selectedCardType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100.0,
              width: double.infinity,
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Text(
                    'Rs.2500.00',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: TextField(),
                    width: 100.0,
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text('Edit'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80.0,
              width: double.infinity,
              child: DropdownButton(
                elevation: 10,
                hint: Text('Select Card Type'),
                value: _selectedCardType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCardType = newValue;
                  });
                },
                items: _card.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 200.0,
            ),
            Container(
              height: 100.0,
              child: FloatingActionButton(
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80.0,
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: SizedBox(
              height: 80.0,
              width: 200.0,
              child: Card(
                elevation: 10.0,
                color: Colors.deepPurple[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                child: ElevatedButton(
                  child: Text(
                    'Pay',
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
