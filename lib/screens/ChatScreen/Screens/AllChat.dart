import 'package:flutter/material.dart';
import 'package:real_estate_application/screens/ChatScreen/Screens/ChatDetailScreen.dart';
import 'package:real_estate_application/screens/ChatScreen/Widgets/chatTile.dart';

class AllChatScreen extends StatelessWidget {
  const AllChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          ChatTile(
            title: "PrimeNest Partners",
            subtitle: "Real Estate Agent",
            imagePath: "assets/images/house1.jpg",
            badge: "01",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailScreen()));
            },
          ),
          ChatTile(
            title: "TruNest Realty",
            subtitle: "Real Estate Agent",
            imagePath: "assets/images/house2.jpg",
            badge: "02",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailScreen()));
            },
          ),
          ChatTile(
            title: "OpalStone Realtors",
            subtitle: "Real Estate Agent",
            imagePath: "assets/images/house3.jpg",
            badge: "03",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailScreen()));
            },
          ),
          ChatTile(
            title: "CozyNest Property",
            subtitle: "Real Estate Agent",
            imagePath: "assets/images/house4.jpg",
            badge: "08",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailScreen()));
            },
          ),
          ChatTile(
            title: "Verity Homes",
            subtitle: "Real Estate Agent",
            imagePath: "assets/images/house5.jpg",
            badge: "",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailScreen()));
            },
          ),
          ChatTile(
            title: "TruNest Realty",
            subtitle: "Real Estate Agent",
            imagePath: "assets/images/house6.jpg",
            badge: "04",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailScreen()));
            },
          ),
        ],
      ),
    );
  }
}
