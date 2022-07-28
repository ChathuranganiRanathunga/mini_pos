import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentDetailTile extends StatelessWidget {
  final Widget image;
  final String buttonPayment;
  final String route;

  const PaymentDetailTile({Key key, this.image, this.buttonPayment, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: image,
                      /* Image.asset(
                        'assets/images/card.jpg',
                        width: 220.0,
                        fit: BoxFit.fill,
                      ),*/
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    width: 120.0,
                    child: Card(
                      color: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          elevation: 20.0,
                        ),
                        child: Text(
                          buttonPayment,
                          style: GoogleFonts.lato(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(route);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
