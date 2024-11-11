import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'barbershop_model.dart';
import 'review_model.dart';

class BarbershopController extends GetxController {
  // Observable list of all barbershops
  var barbershops = <Barbershop>[].obs;

  // Observable list of popular barbers (filtered)
  var popularBarbers = <Barbershop>[].obs;

  // Observable list of reviews
  var reviews = <Review>[].obs;

  // Observable index for the current image
  var currentImageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Load barbershops and reviews at initialization
    loadBarbershops();
    loadReviews();
  }

  // Function to load barbershops from JSON file
  Future<void> loadBarbershops() async {
    final String response = await rootBundle.loadString('assets/barbershop.json');
    final List<dynamic> data = json.decode(response);
    barbershops.value = data.map((json) => Barbershop.fromJson(json)).toList();
    popularBarbers.value = barbershops.where((barber) => barber.rating >= 4.5).toList();
  }

  // Function to load reviews from JSON file
  Future<void> loadReviews() async {
    final String response = await rootBundle.loadString('assets/reviews.json');
    final List<dynamic> data = json.decode(response);
    reviews.value = data.map((json) => Review.fromJson(json)).toList();
  }
}
