import 'package:flutter/material.dart';
import 'package:fruitshop/routes/routes.dart';
import 'package:fruitshop/screens/home/home.dart';
import 'package:fruitshop/screens/search/search.dart';
import 'package:fruitshop/screens/signin/sign_in.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fruit Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: Routes.routes,
    initialRoute: Routes.initialHome);
  }
}
