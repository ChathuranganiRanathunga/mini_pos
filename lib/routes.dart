import 'package:demo_app_2021_04_20/pages/add_customers.dart';
import 'package:demo_app_2021_04_20/pages/add_item.dart';
import 'package:demo_app_2021_04_20/pages/card_payment.dart';
import 'package:demo_app_2021_04_20/pages/cash_payments.dart';
import 'package:demo_app_2021_04_20/pages/dash_board.dart';
import 'package:demo_app_2021_04_20/pages/display_customers.dart';
import 'package:demo_app_2021_04_20/pages/display_items.dart';
import 'package:demo_app_2021_04_20/pages/invoice.dart';
import 'package:demo_app_2021_04_20/pages/item_selection.dart';
import 'package:demo_app_2021_04_20/pages/login.dart';
import 'package:demo_app_2021_04_20/pages/payments.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  LogIn.routeName: (context) => LogIn(),
  DashBoard.routeName: (context) => DashBoard(),
  Invoice.routeName: (context) => Invoice(),
  ItemSelection.routeName: (context) => ItemSelection(),
  Payments.routeName: (context) => Payments(),
  DisplayItems.routeName: (context) => DisplayItems(),
  AddItemPage.routeName: (context) => AddItemPage(),
  DisplayCustomers.routeName: (context) => DisplayCustomers(),
  AddCustomersPage.routeName: (context) => AddCustomersPage(),
  CardPayment.routeName: (context) => CardPayment(),
  CashPayment.routeName: (context) => CashPayment(),
};
