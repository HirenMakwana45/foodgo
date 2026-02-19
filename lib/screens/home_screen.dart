import 'package:flutter/material.dart';
import 'package:testapp/extensions/extension_util/int_extensions.dart';
import 'package:testapp/extensions/extension_util/widget_extensions.dart';
import 'package:testapp/extensions/text_styles.dart';
import 'package:testapp/model/product_model.dart';
import 'package:testapp/screens/product_detail_screen.dart';

import '../components/foodCard.dart';
import '../model/food_model.dart';
import '../utils/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> foodList = [
    ProductModel(
      title: "Wendy's Burger",
      subtitle: "Classic Cheeseburger",
      description:
          "The Cheeseburger Wendy's Burger is a classic fast food burger...",
      image: icBurger_1,
      price: 8.24,
      rating: 4.9,
      deliveryTime: 26,
    ),
    ProductModel(
      title: "Chicken Burger",
      subtitle: "Classic Cheeseburger",
      description:
          "The Cheeseburger Wendy's Burger is a classic fast food burger...",
      image: icBurger_2,
      price: 8.24,
      rating: 4.9,
      deliveryTime: 26,
    ),
    ProductModel(
      title: "Fried Chicken Burger",
      subtitle: "KFC Special",
      description:
          "The Cheeseburger Wendy's Burger is a classic fast food burger...",
      image: icBurger_3,
      price: 8.24,
      rating: 4.9,
      deliveryTime: 26,
    ),
    ProductModel(
      title: "Hamm Chicken",
      subtitle: "KFC Special",
      description:
          "The Cheeseburger Wendy's Burger is a classic fast food burger...",
      image: icBurger_4,
      price: 8.24,
      rating: 4.9,
      deliveryTime: 26,
    ),
  ];
  final List<String> _categories = [
    "All",
    "Combos",
    "Sliders",
    "Classics",
    "Sides",
  ];
  int _selectedIndex = 0;
  Widget _buildCategoryChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200), // Smooth color transition
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE93030) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(20),
          // boxShadow: isSelected
          //     ? [
          //         BoxShadow(
          //           color: const Color(0xFFE93030).withValues(blue:0.3),
          //           blurRadius: 4,
          //           offset: const Offset(0, 3),
          //         ),
          //       ]
          //     : [],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        28.height,
        Image.asset(icLogo, color: Colors.black, width: 100, fit: BoxFit.cover),
        Text(
          'Order your favourite food!',
          style: secondaryTextStyle(color: Color(0XFF6A6A6A), size: 18),
        ),

        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.black87),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFE93030), // The red color from your image
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.tune,
                color: Colors.white,
              ), // Filter/Settings icon
            ),
          ],
        ),
        SizedBox(height: 30),
        SizedBox(
          height: 50, // Fixed height for the horizontal list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return _buildCategoryChip(
                label: _categories[index],
                isSelected: _selectedIndex == index,
                onTap: () {
                  setState(() {
                    _selectedIndex = index; // Update state and rebuild UI
                  });
                },
              );
            },
          ),
        ),
        Expanded(
          child: GridView.builder(
            // padding: const EdgeInsets.all(16),
            itemCount: foodList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.73,
            ),
            itemBuilder: (context, index) {
              final food = foodList[index];
              return FoodCard(
                onTap: () {
                  ProductDetailsScreen(product: food).launch(context);
                },
                image: food.image,
                title: food.title,
                subtitle: food.subtitle,
                rating: food.rating,
                description: food.description,
                price: food.price,
                deliveryTime: food.deliveryTime,
              );
            },
          ),
        ),
      ],
    ).paddingAll(16);
  }
}
