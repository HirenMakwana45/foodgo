import 'package:flutter/material.dart';
import 'package:testapp/extensions/extension_util/widget_extensions.dart';
import 'package:testapp/screens/cart_screen.dart';

import '../model/product_model.dart';


class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 2;
  double spiciness = 0.4;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.black))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all( 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Dynamic Image
                Center(
                  child: Image.asset(
                    widget.product.image,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 30),
      
                // 2. Product Name
                Text(
                  widget.product.title,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
      
                // 3. Rating and Time
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 20),
                    const SizedBox(width: 4),
                    Text("${widget.product.rating}  —  ${widget.product.deliveryTime} mins",
                        style: TextStyle(color: Colors.grey[600], fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 20),
      
                // 4. Description
                Text(
                  widget.product.description,
                  style: TextStyle(color: Colors.grey[600], height: 1.5, fontSize: 15),
                ),
                const SizedBox(height: 30),
      
                // 5. Interactive Section (Spicy & Portion)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSpicinessSlider(),
                    _buildPortionCounter(),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomActionBar(),
      ),
    );
  }

  // --- UI Helper Methods ---

  Widget _buildSpicinessSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Spicy", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          width: 150,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 6,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
              activeTrackColor: Colors.redAccent,
              inactiveTrackColor: Colors.red[50],
            ),
            child: Slider(
              value: spiciness,
              onChanged: (val) => setState(() => spiciness = val),
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Mild", style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
            SizedBox(width: 80),
            Text("Hot", style: TextStyle(color: Colors.red, fontSize: 12)),
          ],
        )
      ],
    );
  }

  Widget _buildPortionCounter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Portion", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)],
          ),
          child: Row(
            children: [
              _counterButton(Icons.remove, () => setState(() => quantity > 1 ? quantity-- : null)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text("$quantity", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              _counterButton(Icons.add, () => setState(() => quantity++)),
            ],
          ),
        )
      ],
    );
  }

  Widget _counterButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(15)),
            child: Text("\$${(widget.product.price * quantity).toStringAsFixed(2)}",
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF322A28),
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                CartScreen(product: widget.product).launch(context);

              },
              child: const Text("ORDER NOW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}