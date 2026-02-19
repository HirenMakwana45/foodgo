import 'package:flutter/material.dart';
import '../model/option_item.dart';

class OptionCard extends StatelessWidget {
  final OptionItem item;
  final VoidCallback onTap;

  const OptionCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(item.image, fit: BoxFit.contain),
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF322A28), // Dark brown from design
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.name, style: const TextStyle(color: Colors.white, fontSize: 12)),
                const Icon(Icons.add_circle, color: Colors.redAccent, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}