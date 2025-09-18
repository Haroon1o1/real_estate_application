import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyDetailsHeaderWidget extends StatelessWidget {
  const PropertyDetailsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/house1.jpg",
            height: size.height * 0.25,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        /// Blue check icon
        Positioned(
          top: 12,
          left: 12,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Image.asset("assets/icons/verified.png", width: 18),
          ),
        ),

        /// Rating
        Positioned(
          top: 12,
          right: 12,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Image.asset("assets/icons/star.png", width: 12),
                SizedBox(width: 4),
                Text("4.5", style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),

        /// Rent price
        Positioned(
          bottom: 12,
          left: 12,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0x4D606060).withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "10,000/ Month",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: size.width * 0.035,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
