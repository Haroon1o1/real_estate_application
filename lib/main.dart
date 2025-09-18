import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_application/screens/HomeScreen/HomeScreen.dart';
import 'package:real_estate_application/screens/details_screen/house_details_screen.dart';
import 'package:real_estate_application/screens/details_screen/provider/house_detail_provider.dart';
import 'package:real_estate_application/screens/photo_screen/photo_screen.dart';
import 'package:real_estate_application/screens/photo_screen/provider/photo_provider.dart';
import 'package:real_estate_application/screens/splash_screen/main_splash_screen.dart';
import 'package:real_estate_application/screens/splash_screen/provider/Splash_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
        ChangeNotifierProvider<PhotoProvider>(create: (_) => PhotoProvider()),
        ChangeNotifierProvider<HouseDetailProvider>(create: (_) => HouseDetailProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        home: HomeScreen(),
      ),
    );
  }
}
