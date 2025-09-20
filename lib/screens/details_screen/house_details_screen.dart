import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/models/HouseModel.dart';
import 'package:real_estate_application/screens/details_screen/widgets/property_details_header_widget.dart';
import 'package:real_estate_application/screens/details_screen/widgets/property_details_widget.dart';
import 'package:real_estate_application/screens/details_screen/widgets/property_photos_widget.dart';
import 'package:real_estate_application/screens/details_screen/widgets/property_title_widget.dart';
import 'package:real_estate_application/widgets/Custom_Button.dart';

class HouseDetailScreen extends StatelessWidget {
  HouseModel model;
  HouseDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back, color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "${model.title}",
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
            PropertyDetailsHeaderWidget(
              rent: model.rent,
              ratings: model.ratings,
              isVerified: model.isVerified,
              image: model.image,
            ),
            SizedBox(height: 16),
            PropertyTitleWidget(title: model.title, location: model.location),
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
            PropertyPhotosWidget(model: model),

            SizedBox(height: 20),

            Text(
              "Property Details",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: size.width * 0.04),
            ),
            SizedBox(height: 16),
            PropertyDetailsWidget(model: model),
            SizedBox(height: 20),

            /// Description
            CustomButton(
              height: 50,
              textColor: Colors.white,
              text: "Book now",
              press: () {},
              size: 15,
              color: Color(0xFF1D70FF),
              hasIcon: false,
            ),
          ],
        ),
      ),
    );
  }
}
