import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionTile extends StatelessWidget {
  final String label;
  final String route;

  const ActionTile({Key key, @required this.label,this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          primary: Colors.deepPurple[600],
        ),
        child: Text(label,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              color: Colors.white,
            ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(route);
        },
      ),
    );
  }
}
