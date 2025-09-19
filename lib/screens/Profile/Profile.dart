import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/screens/Profile/widgets/profile_card.dart';
import 'package:real_estate_application/screens/Profile/widgets/settings_card.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Settings",
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 20),

                const ProfileCard(),

                const SizedBox(height: 20),

                SettingsCard(
                  items: const [
                    {"icon": Icons.person_outline, "title": "Account Details"},
                    {"icon": Icons.info_outline, "title": "Personal Information"},
                    {"icon": Icons.brightness_6_outlined, "title": "App Theme"},
                    {"icon": Icons.lock_outline, "title": "Support"},
                    {"icon": Icons.help_outline, "title": "Help & Info"},
                  ],
                ),

                const SizedBox(height: 20),

                // Second settings card
                SettingsCard(
                  items: const [
                    {"icon": Icons.map_outlined, "title": "Change Location"},
                    {"icon": Icons.star_border, "title": "Favorited Places"},
                    {"icon": Icons.public, "title": "Country"},
                    {"icon": Icons.home_outlined, "title": "Home Type"},
                    {"icon": Icons.tune, "title": "Filter Price Range"},
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
