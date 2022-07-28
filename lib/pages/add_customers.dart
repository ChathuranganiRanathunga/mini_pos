import 'package:demo_app_2021_04_20/data/customers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class AddCustomersPage extends StatefulWidget {
  static String routeName = '/add-customers';

  const AddCustomersPage({Key key}) : super(key: key);

  @override
  _AddCustomersPageState createState() => _AddCustomersPageState();
}

class _AddCustomersPageState extends State<AddCustomersPage> {
  final _formKey = GlobalKey<FormState>();
  String _shopName;
  String _customerName;
  String _address;
  String _contactNumber;

  Box<Customers> _customerBox;

  @override
  void initState() {
    super.initState();
    Hive.openBox<Customers>(CUSTOMER_BOX_NAME)
        .then((box) => _customerBox = box);
  }

  void _onSubmit() async {
    if (_formKey.currentState.validate() && Hive.isBoxOpen(CUSTOMER_BOX_NAME)) {
      _formKey.currentState.save();
      await _customerBox.put(
        _shopName,
        Customers(
          shopName: _shopName,
          customerName: _customerName,
          location: _address,
          contactNumber: _contactNumber,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.deepPurple[400],
          content: Text(
            'Item Added!',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text(
          'New Customer',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 26,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 40.0, bottom: 10.0, left: 20.0, right: 20.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        gapPadding: 4.0,
                      ),
                      hintText: 'Shop Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter some text';
                      }
                      return null;
                    },
                    onSaved: (value) => setState(() {
                      _shopName = value;
                    }),
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        gapPadding: 4.0,
                      ),
                      hintText: 'Customer Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter some text';
                      }
                      return null;
                    },
                    onSaved: (value) => setState(() {
                      _customerName = value;
                    }),
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        gapPadding: 4.0,
                      ),
                      hintText: 'Address',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter some text';
                      }
                      return null;
                    },
                    onSaved: (value) => setState(() {
                      _address = value;
                    }),
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        gapPadding: 4.0,
                      ),
                      hintText: 'Contact Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter some text';
                      }
                      return null;
                    },
                    onSaved: (value) => setState(() {
                      _contactNumber = value;
                    }),
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 30.0, top: 20.0),
        child: Container(
          height: 60.0,
          alignment: Alignment.center,
          child: SizedBox(
            width: 200.0,
            height: 50.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                primary: Colors.deepPurple[900],
              ),
              onPressed: _onSubmit,
              child: Text(
                'Save',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _customerBox.close();
  }
}
