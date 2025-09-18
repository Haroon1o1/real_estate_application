import 'package:flutter/material.dart';

class PropertyPhotosWidget extends StatelessWidget {
  const PropertyPhotosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var i = 1; i <= 4; i++)
            Container(
              margin: EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/house$i.jpg",
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
