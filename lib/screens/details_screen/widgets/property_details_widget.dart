import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyDetailsWidget extends StatelessWidget {
  const PropertyDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 20,
        children: [
          _buildDetail("assets/icons/room.png", "3", "Bedrooms"),
          _buildDetail("assets/icons/bath.png", "2", "Bathrooms"),
          _buildDetail("assets/icons/area.png", "1550", "Area (in Sqft)"),
          _buildDetail("assets/icons/calendar.png", "2019", "Build in Year"),
          _buildDetail("assets/icons/room.png", "2", "Living Rooms"),
          _buildDetail("assets/icons/car.png", "2 Cars", "Parking"),
        ],
      ),
    );
  }

  Widget _buildDetail(String image, String value, String label) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 28),
          SizedBox(height: 6),
          Text(value, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
