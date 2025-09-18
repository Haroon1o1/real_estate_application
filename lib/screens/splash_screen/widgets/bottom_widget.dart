import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_application/screens/splash_screen/provider/Splash_provider.dart';
import 'package:real_estate_application/screens/splash_screen/widgets/bottom_curve.dart';
import 'package:real_estate_application/widgets/Custom_Button.dart';

class SplashBottomWidget extends StatelessWidget {
  const SplashBottomWidget({super.key});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: context.watch<SplashProvider>().slideAnimation,
        child: ClipPath(
          clipper: TopCurveClipper(),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 20, right: 20, top: size.height * 0.07, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "WELCOME",
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Find your next space, feel at home\nWhere comfort meets convenience",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: size.width * 0.035),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  hasIcon: false,
                  height: 50,
                  textColor: Colors.white,
                  text: "Sign In",
                  press: () {},
                  size: size.width * 0.035,
                  color: Colors.black,
                ),
                const SizedBox(height: 12),
                CustomButton(
                  hasIcon: false,
                  height: 50,
                  isOutline: true,
                  textColor: Colors.black,
                  text: "Explore",
                  press: () {},
                  size: size.width * 0.035,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
