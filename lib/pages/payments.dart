import 'package:demo_app_2021_04_20/Widgets/payments/payment_detail_tile.dart';
import 'package:demo_app_2021_04_20/pages/card_payment.dart';
import 'package:demo_app_2021_04_20/pages/cash_payments.dart';
import 'package:demo_app_2021_04_20/pages/invoice.dart';
import 'package:flutter/material.dart';

class Payments extends StatefulWidget {
  static String routeName = '/payments';

  const Payments({Key key}) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  Invoice invoice = Invoice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 30.0,
          ),
          ClipPath(
            clipper: LoginClipper(),
            child: Container(
              height: 280.0,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.deepPurple[400],
                    Colors.purple[600],
                  ],
                ),
              ),
              //child: Text(''),
            ),
          ),
          Container(
            child: PaymentDetailTile(
              image: Image.asset(
                'assets/images/card0.jpg',
                width: 200.0,
                height: 150.0,
                fit: BoxFit.fill,
              ),
              buttonPayment: 'Pay',
              route: CardPayment.routeName,
            ),
          ),
          Container(
            child: PaymentDetailTile(
              image: Image.asset(
                'assets/images/SLmoney.jpg',
                width: 200.0,
                height: 150.0,
                fit: BoxFit.fill,
              ),
              buttonPayment: 'Pay',
              route: CashPayment.routeName,
            ),
          ),
        ],
      ),
    );
  }
}

class LoginClipper extends CustomClipper<Path> {
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
