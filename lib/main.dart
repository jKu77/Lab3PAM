import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'barbershop_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inițializăm controllerul aici pentru a fi disponibil global în aplicație
    Get.put(BarbershopController());

    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
