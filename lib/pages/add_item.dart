import 'package:demo_app_2021_04_20/data/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class AddItemPage extends StatefulWidget {
  static String routeName = '/add-item';

  const AddItemPage({Key key}) : super(key: key);

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {

  final _formKey = GlobalKey<FormState>();
  String _itemCode;
  String _itemName;
  String _itemPrice;

  Box<Item> _itemBox;

  @override
  void initState() {
    super.initState();
    Hive.openBox<Item>(ITEM_BOX_NAME).then((box) => _itemBox = box);
  }

  void _onSubmit() async {
    if (_formKey.currentState.validate() && Hive.isBoxOpen(ITEM_BOX_NAME)) {
      _formKey.currentState.save();
      await _itemBox.put(
        _itemCode,
        Item(
          itemName: _itemName,
          code: _itemCode,
          unitPrice: double.tryParse(_itemPrice),
        ),
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
          backgroundColor: Colors.deepPurple[400],
          content: Text(
              'Item Added!',
            style: GoogleFonts.lato(
              fontSize: 18,
              color: Colors.white,
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
          'Add Items',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 40.0, bottom: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    gapPadding: 4.0,
                  ),
                  hintText: 'Item Name',
                ),
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please item name';
                  }
                  return null;
                },
                onSaved: (value) => setState(() {
                  _itemName = value;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(
                  signed: false,
                  decimal: false,
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Item Price'),
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please price';
                  }
                  return null;
                },
                onSaved: (value) => setState(() {
                  _itemPrice = value;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Item Code',
                ),
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please item code';
                  }
                  return null;
                },
                onSaved: (value) => setState(() {
                  _itemCode = value;
                }),
              ),
            ),
          ],
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
    _itemBox.close();
  }
}
