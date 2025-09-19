import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isActive;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          icon,
          width: label == "Locations" ? 18 : 20,
          color: isActive ? Color(0xFF0F66FB) : Color(0xFF364856).withValues(alpha: 0.4),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
            color: isActive ? Color(0xFF0F66FB) : Color(0xFF364856).withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }
}
