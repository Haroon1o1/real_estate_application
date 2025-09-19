import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_application/screens/HomeScreen/provider/home_provider.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Row(
        children: [
          Image.asset("assets/icons/search.png", width: 18, color: Color(0xFF364856)),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: (value) {
                provider.setSearchQuery(value); // 👈 updates provider
              },
              decoration: InputDecoration(
                hintText: "Search Place here",
                border: InputBorder.none,
                hintStyle: GoogleFonts.poppins(fontSize: 14),
              ),
            ),
          ),
          Icon(Icons.tune, color: Color(0xFF364856)),
        ],
      ),
    );
  }
}
