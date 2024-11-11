import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'barbershop_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize BarbershopController globally in the application
    Get.put(BarbershopController());

    return GetMaterialApp(  // Use GetMaterialApp instead of MaterialApp
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
