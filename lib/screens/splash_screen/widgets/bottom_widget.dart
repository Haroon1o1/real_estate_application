import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/screens/splash_screen/widgets/bottom_curve.dart';
import 'package:real_estate_application/widgets/Custom_Button.dart';

class SplashBottomWidget extends StatefulWidget {
  const SplashBottomWidget({super.key});

  @override
  State<SplashBottomWidget> createState() => _SplashBottomWidgetState();
}

class _SplashBottomWidgetState extends State<SplashBottomWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // start off-screen bottom
      end: Offset.zero, // final position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward(); // start animation when widget builds
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: _slideAnimation,
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
                SizedBox(height: 12),
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
