import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/screens/HomeScreen/widgets/FilterChipWidget.dart';
import 'package:real_estate_application/screens/HomeScreen/widgets/HouseCard.dart';
import 'package:real_estate_application/screens/HomeScreen/widgets/NavigationItem.dart';
import 'package:real_estate_application/screens/HomeScreen/widgets/SearchBarWidget.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> houses = [
    {
      "title": "Georgie House",
      "location": "Kochi, Kerala",
      "price": "10,000/ Month",
      "image": "assets/images/house1.jpg",
    },
    {
      "title": "Max House",
      "location": "Edappally, Kerala",
      "price": "12,000/ Month",
      "image": "assets/images/house2.jpg",
    },
    {
      "title": "Lunia Haven",
      "location": "Fort Kochi, Kerala",
      "price": "30,000/ Month",
      "image": "assets/images/house3.jpg",
    },
    {
      "title": "The Serene Nest",
      "location": "Kakkanad, Kerala",
      "price": "20,000/ Month",
      "image": "assets/images/house4.jpg",
    },
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row
                  _buildTopRow(),
                  const SizedBox(height: 20),
                  _buildTitleSection(),
                  const SizedBox(height: 20),
                  const SearchBarWidget(),
                  const SizedBox(height: 20),
                  _buildFilterChips(),
                  const SizedBox(height: 20),
                  _buildHouseGrid(),
                ],
              ),
            ),
          ),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.black),
            const SizedBox(width: 6),
            Text(
              "Kochi, Kerala",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.notifications_none, size: 26),
            SizedBox(width: 12),
            CircleAvatar(radius: 18, backgroundImage: AssetImage("assets/images/profile.jpg")),
          ],
        ),
      ],
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Discover", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 22)),
        Text(
          "Your New House",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilterChipWidget("Rental House", true),
          FilterChipWidget("Apartment", false),
          FilterChipWidget("Houses", false),
          FilterChipWidget("Rooms", false),
        ],
      ),
    );
  }

  Widget _buildHouseGrid() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nearby Rental House's",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              itemCount: houses.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final house = houses[index];
                return HouseCard(
                  title: house["title"]!,
                  location: house["location"]!,
                  price: house["price"]!,
                  imageUrl: house["image"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 16,
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 6))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationItem(icon: Icons.home, label: "Home", isActive: true),
            NavigationItem(icon: Icons.location_on, label: "Locations", isActive: false),
            NavigationItem(icon: Icons.chat_bubble_outline, label: "Chat", isActive: false),
            NavigationItem(icon: Icons.settings, label: "Settings", isActive: false),
          ],
        ),
      ),
    );
  }
}
