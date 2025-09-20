import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/models/HouseModel.dart';

class PropertyDetailsWidget extends StatelessWidget {
  HouseModel model;
  PropertyDetailsWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 20,
        children: [
          _buildDetail("assets/icons/room.png", "${model.bedrooms}", "Bedrooms"),
          _buildDetail("assets/icons/bath.png", "${model.bathrooms}", "Bathrooms"),
          _buildDetail("assets/icons/area.png", "${model.area}", "Area (in Sqft)"),
          _buildDetail("assets/icons/calendar.png", "${model.buildYear}", "Build in Year"),
          _buildDetail("assets/icons/room.png", "${model.livingRooms}", "Living Rooms"),
          _buildDetail("assets/icons/car.png", "${model.garage} Cars", "Parking"),
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
