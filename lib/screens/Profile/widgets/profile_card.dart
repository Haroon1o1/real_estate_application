import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/widgets/Custom_Button.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/44.jpg"),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Leslie Alexander",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                Text(
                  "lesliaex@gmail.com",
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 100,
            child: CustomButton(
              height: 40,
              hasIcon: false,
              textColor: Colors.white,
              text: "Log out",
              press: () {},
              size: 14,
              color: Color(0xFF0F66FB),
            ),
          ),
        ],
      ),
    );
  }
}
