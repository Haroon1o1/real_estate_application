import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/screens/splash_screen/widgets/bottom_widget.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            /// Background Image
            Positioned.fill(
              child: Image.asset("assets/images/splash-house.jpg", fit: BoxFit.cover),
            ),

            /// Black Overlay
            Positioned.fill(child: ColoredBox(color: Colors.black.withValues(alpha: 0.1))),

            /// Center Logo + Text
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // Circular Logo
                  Text(
                    "DWELLA",
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.060,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Find your dream House",
                    style: TextStyle(fontSize: size.width * 0.040, color: Colors.black38),
                  ),
                ],
              ),
            ),

            /// Bottom White Container
            SplashBottomWidget(),
          ],
        ),
      ),
    );
  }
}
