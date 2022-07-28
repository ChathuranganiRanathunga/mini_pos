import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CashPayment extends StatelessWidget {
  static String routeName = '/cash-payment';
  const CashPayment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: ClipPath(
              clipper: CashPaymentClipper(),
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.deepPurple[900],
                      Colors.purple[300],
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Item Name'),
                Text('Count'),
              ],
            ),
          ),
          SizedBox(
            height: 200.0,
          ),
          Text('Discount'),
          Text('Total Bill'),
        ],
      ),
      bottomSheet: SizedBox(
        height: 80.0,
        child: Center(
          child: SizedBox(
            height: 50.0,
            width: 150.0,
            child: ElevatedButton(
              child: Text(
                'Pay',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CashPaymentClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
