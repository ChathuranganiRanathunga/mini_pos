import 'package:demo_app_2021_04_20/data/customers.dart';
import 'package:demo_app_2021_04_20/data/item.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(CustomersAdapter());

  runApp(MyApp());
}
