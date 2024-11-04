import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'barbershop_model.dart';

class BarbershopController extends GetxController {
  // O listă observabilă de barbershops
  var barbershops = <Barbershop>[].obs;

  // Index observabil pentru imaginea curentă din UI
  var currentImageIndex = 0.obs;

  // Metoda `onInit` se execută la inițializarea controller-ului
  @override
  void onInit() {
    super.onInit();
    // Încarcă barbershops la inițializare
    loadBarbershops();
  }

  // Funcție pentru încărcarea datelor din fișierul JSON
  Future<void> loadBarbershops() async {
    // Încarcă fișierul JSON din assets
    final String response = await rootBundle.loadString('assets/barbershop.json');
    // Decodifică JSON-ul într-o listă de mapări
    final List<dynamic> data = json.decode(response);
    
    // Convertește fiecare mapă JSON într-un obiect `Barbershop` și adaugă-l la lista observabilă
    barbershops.value = data.map((json) => Barbershop.fromJson(json)).toList();
  }
}
