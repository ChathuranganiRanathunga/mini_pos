import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class LoginDetailFields extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  LoginDetailFields({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:EdgeInsets.symmetric(vertical:10.0,horizontal:20.0),
              child:TextFormField(
                decoration:InputDecoration(
                  border:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(40.0),
                    gapPadding: 4.0,
                  ),
                  hintText: 'UserName',
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please Enter User Name !';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: Container(
                child: PasswordField(
                  color:Colors.deepPurple,
                  hasFloatingPlaceholder: true,
                  pattern: r'.*[@$#.*].*',
                  errorMessage:'must contain special character either . * @ # \$',
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(40.0),
                    gapPadding: 4.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
