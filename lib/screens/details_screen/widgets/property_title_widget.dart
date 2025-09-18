import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/house_detail_provider.dart';

class PropertyTitleWidget extends StatelessWidget {
  const PropertyTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Georgie House",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.055,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 18, color: Colors.red),
                  const SizedBox(width: 4),
                  Text(
                    "Kochi, Kerala",
                    style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// Favourite button
        Consumer<HouseDetailProvider>(
          builder: (context, provider, child) {
            return GestureDetector(
              onTap: () => provider.toggleFavorite(),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  provider.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: provider.isFavorite ? Colors.red : Colors.black,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
