import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  final IconData icon;
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
        Icon(icon, color: isActive ? Colors.blueAccent : Colors.grey),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.blueAccent : Colors.grey,
          ),
        ),
      ],
    );
  }
}
