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
      name: json['name'],
      distance: json['distance'],
      rating: json['rating'].toDouble(),
      image: json['image'],
    );
  }
}
