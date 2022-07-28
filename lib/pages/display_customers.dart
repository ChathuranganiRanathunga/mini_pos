import 'package:demo_app_2021_04_20/Widgets//customers/display_tile.dart';
import 'package:demo_app_2021_04_20/data/customers.dart';
import 'package:demo_app_2021_04_20/pages/add_customers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';


class DisplayCustomers  extends StatelessWidget {
  static String routeName = '/display-customers';

  DisplayCustomers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Container(
          child: Text('Customers',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              )
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: Hive.openBox<Customers>(CUSTOMER_BOX_NAME),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Center(child: Text(snapshot.error.toString()));
            else {
              final List<Customers> _customers = snapshot.data.values.toList();
              return _customers.length > 0
                  ? Padding(
                padding: const EdgeInsets.only(top:30.0,bottom: 20.0,left: 8.0,right:8.0),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _customers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      DisplayTileCustomer(
                        shopName: _customers[index].shopName,
                        customerName: _customers[index].customerName,
                        location: _customers[index].location,
                        contactNumber: _customers[index].contactNumber,
                      ),
                    ],
                  ),
                ),
              )
                  : Center(
                child: Text("Empty"),
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      bottomSheet: Container(
        alignment: Alignment.topRight,
        width: double.infinity,
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom:8.0,right: 12.0),
          child: FloatingActionButton(
            backgroundColor: Colors.deepPurple[900],
            child: Icon(
              Icons.add,
              size:34,
            ),
            onPressed: (){
              Navigator.of(context).pushNamed(AddCustomersPage.routeName);
            },
          ),
        ),
      ),
    );
  }
}
