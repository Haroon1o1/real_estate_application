import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/screens/details_screen/widgets/property_details_header_widget.dart';
import 'package:real_estate_application/screens/details_screen/widgets/property_details_widget.dart';
import 'package:real_estate_application/screens/details_screen/widgets/property_photos_widget.dart';
import 'package:real_estate_application/screens/details_screen/widgets/property_title_widget.dart';
import 'package:real_estate_application/widgets/Custom_Button.dart';

class HouseDetailScreen extends StatelessWidget {
  HouseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Georgie House Details",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: size.width * 0.045,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PropertyDetailsHeaderWidget(),
            SizedBox(height: 16),
            PropertyTitleWidget(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Property Photos",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * 0.04,
                  ),
                ),
                Text(
                  "See all",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            PropertyPhotosWidget(),

            SizedBox(height: 20),

            Text(
              "Property Details",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: size.width * 0.04),
            ),
            SizedBox(height: 16),
            PropertyDetailsWidget(),
            SizedBox(height: 20),

            /// Description
            CustomButton(
              height: 50,
              textColor: Colors.white,
              text: "Book now",
              press: () {},
              size: 15,
              color: const Color.fromARGB(255, 29, 112, 255),
              hasIcon: false,
            ),
          ],
        ),
      ),
    );
  }
}
