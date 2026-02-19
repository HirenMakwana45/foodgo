import 'package:flutter/material.dart';
import 'package:testapp/utils/app_images.dart';

import '../components/option_card.dart';
import '../model/option_item.dart';
import '../model/product_model.dart';

class CartScreen extends StatefulWidget {
  final ProductModel product;
  const CartScreen({super.key,required this.product});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 2;
  double spiciness = 0.4;
  List<OptionItem> toppings = [
    OptionItem(name: "Tomato", image: icTomato),
    OptionItem(name: "Onions", image: icOnions),
    OptionItem(name: "Pickles", image: icPickles),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(leading: const BackButton(), backgroundColor: Colors.transparent, elevation: 0),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section: Image and Spiciness/Portion
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(child: Image.asset(widget.product.image, height: 250)),
                    Expanded(child: _buildRightControls()),
                  ],
                ),
              ),
      
              _buildSectionTitle("Toppings"),
              _buildHorizontalList(toppings),
      
              _buildSectionTitle("Side options"),
              _buildHorizontalList(toppings), // Reuse list or pass sideOptions list
      
              const SizedBox(height: 100), // Space for bottom bar
            ],
          ),
        ),
        bottomSheet: _buildBottomCheckoutBar(),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildHorizontalList(List<OptionItem> items) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) => OptionCard(item: items[index], onTap: () {}),
      ),
    );
  }

  Widget _buildBottomCheckoutBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Total", style: TextStyle(color: Colors.grey, fontSize: 16)),
              Text("\$16.49", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            onPressed: () {},
            child: const Text("ORDER NOW", style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      ),
    );
  }

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

  // Reuse the slider/portion widgets from the previous screen here...
  Widget _buildRightControls() { /* ... same as previous screen ... */ return Container(

    child: Column(children: [
      _buildSpicinessSlider(),
      _buildPortionCounter(),
    ],),
  ); }
}