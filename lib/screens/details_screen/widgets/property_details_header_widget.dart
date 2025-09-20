import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyDetailsHeaderWidget extends StatelessWidget {
  String rent, image;
  double ratings;
  bool isVerified;
  PropertyDetailsHeaderWidget({
    super.key,
    required this.rent,
    required this.ratings,
    required this.isVerified,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "$image",
            height: size.height * 0.25,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        /// Blue check icon
        Visibility(
          visible: isVerified,
          child: Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Image.asset("assets/icons/verified.png", width: 18),
            ),
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
                Text("$ratings", style: TextStyle(fontWeight: FontWeight.w600)),
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
              color: Color(0x4D606060).withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "$rent",
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
