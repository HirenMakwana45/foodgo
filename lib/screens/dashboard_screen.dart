import 'package:flutter/material.dart';
import 'package:testapp/extensions/extension_util/context_extensions.dart';
import 'package:testapp/screens/chat_screen.dart';
import 'package:testapp/screens/profile_screen.dart';

import '../../Utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../model/user_model.dart';
import 'favouriteScreen.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final UserModel currentUser = UserModel(
    name: "Sophia Patel",
    email: "sophiapatel@gmail.com",
    address: "123 Main St Apartment 4A, New York, NY",
    profileImage: "https://example.com/path_to_image.jpg",
  );

  int mCurrentIndex = 0;

  late final List<Widget> tabs;

  Widget _buildNavItem(String iconPath, int index) {
    bool isSelected = mCurrentIndex == index;

    return InkWell(
      onTap: () => setState(() => mCurrentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            height: 24,
            // Unselected icons appear to be white/outline in your image
            color: Colors.white,
          ),
          // The selection dot seen in your image
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 4,
              width: 4,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            )
          else
            const SizedBox(height: 8), // Keep spacing consistent
        ],
      ),
    );
  }

  @override
  void initState() {
    tabs = [
      const HomeScreen(),
      ProfileScreen(user: currentUser), // Pass the user object here
      const ChatScreen(),
      const FavouriteScreen(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: AnimatedContainer(
        color: context.cardColor,
        duration: const Duration(seconds: 1),
        child: IndexedStack(index: mCurrentIndex, children: tabs),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE93030),
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFE93030), // Red background
        shape: const CircularNotchedRectangle(), // Creates the curve
        notchMargin: 10.0, // Space between FAB and the bar
        child: Container(
          // height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side icons
              _buildNavItem(icHome, 0),
              _buildNavItem(icUser, 1),

              // Spacer for the center FAB
              const SizedBox(width: 40),

              // Right side icons
              _buildNavItem(icComment, 2),
              _buildNavItem(icProfile, 3),
            ],
          ),
        ),
      ),
    );
  }
}
