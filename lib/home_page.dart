import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'barbershop_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inițializarea controllerului folosind Get.find() în metoda build
    final BarbershopController barbershopController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/pics/picture.png'),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bine te am gasit,',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Text(
                'Ghemu Gheorghe',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 16),
              Obx(() {
                if (barbershopController.barbershops.isNotEmpty) {
                  return Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(
                          barbershopController
                              .barbershops[
                                  barbershopController.currentImageIndex.value]
                              .image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 16,
                          bottom: 16,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Booking Now'),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      "Nu s-au găsit barbershop-uri",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                }
              }),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cauta un barber sau o locatie..',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 16),
              Obx(() => _buildBarbershopList(barbershopController)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarbershopList(BarbershopController barbershopController) {
    return Column(
      children: barbershopController.barbershops.map((barbershop) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                barbershop.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              barbershop.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.yellow),
                const SizedBox(width: 4),
                Text(barbershop.rating.toString()),
                const SizedBox(width: 8),
                Text(
                  barbershop.distance,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      }).toList(),
    );
  }
}
