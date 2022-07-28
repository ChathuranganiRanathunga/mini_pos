import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String appBarName;

  const AppBarWidget({Key key, this.appBarName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarName),
      ),
    );
  }
}
