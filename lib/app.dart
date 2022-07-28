import 'package:demo_app_2021_04_20/data/cart.dart';
import 'package:demo_app_2021_04_20/pages/login.dart';
import 'package:demo_app_2021_04_20/routes.dart';
import 'package:demo_app_2021_04_20/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: LogIn.routeName,
        theme: myTheme(),
        routes: routes,
      ),
    );
  }
}
