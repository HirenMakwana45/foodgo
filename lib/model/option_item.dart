class OptionItem {
  final String name;
  final String image;
  final double price;
  bool isSelected;

  OptionItem({
    required this.name,
    required this.image,
    this.price = 0.0,
    this.isSelected = false,
  });
}