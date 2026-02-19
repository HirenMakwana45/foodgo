class ProductModel {
  final String title;        // Replaces name/title
  final String subtitle;     // For the list view description
  final String description;  // For the full detail text
  final String image;        // Path to the asset/network image
  final double price;
  final double rating;
  final int deliveryTime;
  final bool isSpicy;
  bool isFavorite;           // Mutable if you want to toggle it

  ProductModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.deliveryTime,
    this.isSpicy = false,
    this.isFavorite = false,
  });
}