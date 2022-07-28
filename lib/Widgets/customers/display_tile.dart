import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayTileCustomer extends StatelessWidget{
  final String shopName;
  final String customerName;
  final String location;
  final String contactNumber;

  DisplayTileCustomer({Key key,this.shopName,this.contactNumber,this.customerName,this.location}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child:Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40.0,
              child: Center(
                child: Text(
                  shopName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
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
                  customerName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      letterSpacing: 0.5,
                      color: Colors.purple[900],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
              child: Center(
                child: Text(
                  location,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      color: Colors.purple[900],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
              child: Center(
                child: Text(
                  contactNumber,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      color: Colors.purple[900],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
