import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_application/screens/splash_screen/provider/Splash_provider.dart';
import 'package:real_estate_application/screens/splash_screen/widgets/bottom_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late SplashProvider splashProvider;

  @override
  void initState() {
    super.initState();
    splashProvider = SplashProvider();
    splashProvider.initAnimation(this); // attach ticker for animation
  }

  @override
  void dispose() {
    splashProvider.disposeAnimation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider.value(
      value: splashProvider,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: Stack(
            children: [
              /// Background Image
              Positioned.fill(
                child: Image.asset(
                  "assets/images/splash-house.jpg",
                  fit: BoxFit.cover,
                ),
              ),

              /// Black Overlay
              Positioned.fill(
                child: ColoredBox(
                  color: Colors.black.withValues(alpha: 0.1),
                ),
              ),

              /// Center Logo + Text
              Positioned(
                top: 120,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      "DWELLA",
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.060,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Find your dream House",
                      style: TextStyle(
                        fontSize: size.width * 0.040,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),

              /// Bottom White Animated Container
              const SplashBottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
