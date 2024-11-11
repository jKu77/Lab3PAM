// review_model.dart
class Review {
  final String userName;
  final String userImage;
  final double rating;
  final String comment;

  Review({
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.comment,
  });

  // Factory constructor to create a `Review` from JSON
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      userName: json['userName'],
      userImage: json['userImage'],
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'],
    );
  }
}
