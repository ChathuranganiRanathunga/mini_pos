import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionItemSelectionTile extends StatelessWidget {

  final String code;
  final String itemName;
  final String unitPrice;

  const ActionItemSelectionTile({Key key, this.code, this.itemName, this.unitPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            child: Center(
              child: Text(
                code,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    color: Colors.purple[900],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                itemName,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    letterSpacing: 0.5,
                    color: Colors.purple[900],
                  ),
                ),
              ),
            ),
          ),
          Text(
            unitPrice.toString(),
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                color: Colors.purple[900],
              ),
            ),
          )
        ],
      ),
    );
  }
}
