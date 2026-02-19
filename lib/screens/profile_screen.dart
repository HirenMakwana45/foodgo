import 'package:flutter/material.dart';
import 'package:testapp/utils/app_common.dart';
import 'package:testapp/utils/app_images.dart';

import '../model/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 60), // Space for the overlapping photo
              _buildInfoFields(),
              const Divider(height: 40, indent: 40, endIndent: 40),
              _buildMenuOption("Payment Details"),
              _buildMenuOption("Order history"),
              const SizedBox(height: 30),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Pink/Red Background Header
        Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Color(0xFFFB3B5B), // Matching the vibrant pink/red
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        // Overlapping Profile Picture
        Positioned(
          bottom: -50,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: CircleAvatar(
              child: cachedImage(icProfile, height: 100),
              radius: 60,
            ),
            // CircleAvatar(
            //   radius: 60,
            //   backgroundImage: cachedImage(user.profileImage),
            // ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          _customTextField(label: "Name", value: user.name),
          const SizedBox(height: 16),
          _customTextField(label: "Email", value: user.email),
          const SizedBox(height: 16),
          _customTextField(label: "Delivery address", value: user.address),
          const SizedBox(height: 16),
          _customTextField(
            label: "Password",
            value: "••••••••••",
            isPassword: true,
          ),
        ],
      ),
    );
  }

  Widget _customTextField({
    required String label,
    required String value,
    bool isPassword = false,
  }) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: isPassword
            ? const Icon(Icons.lock_outline, size: 20)
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      controller: TextEditingController(text: value),
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildMenuOption(String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 40),
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF322A28),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.edit_note),
              label: const Text("Edit Profile"),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.redAccent, width: 2),
                foregroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text("Log out"),
            ),
          ),
        ],
      ),
    );
  }
}
