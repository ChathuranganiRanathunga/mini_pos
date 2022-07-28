import 'package:demo_app_2021_04_20/Widgets//dashboard/action_tile.dart';
import 'package:demo_app_2021_04_20/pages/display_customers.dart';
import 'package:demo_app_2021_04_20/pages/display_items.dart';
import 'package:flutter/material.dart';

import 'invoice.dart';

class DashBoard extends StatelessWidget {
  static String routeName = '/';

  DashBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: LoginClipper(),
            child: Container(
              height: 200.0,
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
            ),
          ),
          SizedBox(
            height: 550.0,
            child: Container(
              child: Container(
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  mainAxisSpacing: 6.0,
                  crossAxisSpacing: 6.0,
                  children: [
                    ActionTile(
                      label: 'Invoice',
                      route: Invoice.routeName,
                    ),
                    ActionTile(
                      label: 'Items',
                      route: DisplayItems.routeName,
                    ),
                    ActionTile(
                      label: 'Customers',
                      route: DisplayCustomers.routeName,
                    ),
                  ],
                ),
              ),
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
