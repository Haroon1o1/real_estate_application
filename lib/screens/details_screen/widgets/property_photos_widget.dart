import 'package:flutter/material.dart';
import 'package:real_estate_application/models/HouseModel.dart';
import 'package:real_estate_application/screens/photo_screen/photo_screen.dart';

class PropertyPhotosWidget extends StatelessWidget {
  final HouseModel model;

  const PropertyPhotosWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.gallery.length,
        itemBuilder: (context, index) {
          final photo = model.gallery[index]["url"]; // or "path" if you name it differently
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HouseGallery(model: model)),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(photo!, width: 100, height: 80, fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}
