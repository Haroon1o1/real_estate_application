// widgets/settings_card.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsCard extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const SettingsCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        children: items
            .map(
              (item) => Column(
                children: [
                  ListTile(
                    leading: Icon(item["icon"], color: Colors.black87),
                    title: Text(item["title"], style: GoogleFonts.poppins(fontSize: 14)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  if (item != items.last) const Divider(indent: 50, thickness: 0.5),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
