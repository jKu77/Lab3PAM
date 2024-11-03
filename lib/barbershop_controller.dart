import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

class Barbershop {
  final String name;
  final String distance;
  final double rating;
  final String image;

  Barbershop({
    required this.name,
    required this.distance,
    required this.rating,
    required this.image,
  });

  factory Barbershop.fromJson(Map<String, dynamic> json) {
    return Barbershop(
      name: json['name'] as String,
      distance: json['distance'] as String,
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
    );
  }
}

class BarbershopController extends GetxController {
  var barbershops = <Barbershop>[].obs;
  var currentImageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadBarbershops();
    startImageSlider();
  }

  Future<void> loadBarbershops() async {
    try {
      final String response =
          await rootBundle.loadString('assets/barbershop.json');
      final List<dynamic> data = json.decode(response);
      barbershops.value =
          data.map((json) => Barbershop.fromJson(json)).toList();
    } catch (e) {
      print("Eroare la încărcarea JSON: $e");
    }
  }

  void startImageSlider() {
    ever(barbershops, (_) {
      currentImageIndex.value = 0;
    });
    Future.delayed(const Duration(seconds: 5), () {
      currentImageIndex.value =
          (currentImageIndex.value + 1) % barbershops.length;
    });
  }
}