import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_application/screens/ChatScreen/Screens/AllChat.dart';
import 'package:real_estate_application/screens/HomeScreen/provider/home_provider.dart';
import 'package:real_estate_application/screens/HomeScreen/widgets/FilterChipWidget.dart';
import 'package:real_estate_application/screens/HomeScreen/widgets/HouseCard.dart';
import 'package:real_estate_application/screens/HomeScreen/widgets/NavigationItem.dart';
import 'package:real_estate_application/screens/HomeScreen/widgets/SearchBarWidget.dart';
import 'package:real_estate_application/screens/Profile/Profile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    final pages = [
      _buildHomePage(context, provider),
      Center(child: Text("Locations Page", style: GoogleFonts.poppins(fontSize: 18))),
      AllChatScreen(),
      SettingsScreen(),
    ];

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset("assets/icons/location.png", width: 24, color: Color(0xFF364856)),
                    SizedBox(width: 6),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF364856),
                      ),
                      child: Text(
                        "Islamabad, Pakistan",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset("assets/icons/notification.png", width: 26, color: Color(0xFF364856)),
                  SizedBox(width: 12),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/women/44.jpg",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        body: pages[provider.selectedNavIndex],

        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(12),
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 4, offset: const Offset(1, 2)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, 0, "assets/icons/house.png", "Home"),
              _buildNavItem(context, 1, "assets/icons/location-filled.png", "Locations"),
              _buildNavItem(context, 2, "assets/icons/chat.png", "Chat"),
              _buildNavItem(context, 3, "assets/icons/settings.png", "Settings"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomePage(BuildContext context, HomeProvider provider) {
    final filteredHouses = provider.filteredHouses;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      children: [
        Text(
          "Discover",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: const Color(0xFF364856),
          ),
        ),
        Text(
          "Your New House",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: const Color(0xFF364856),
          ),
        ),
        const SizedBox(height: 20),

        const SearchBarWidget(),
        const SizedBox(height: 20),

        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.filters.length,
            itemBuilder: (context, index) {
              return FilterChipWidget(
                provider.filters[index],
                provider.selectedFilterIndex == index,
                () => provider.setFilterIndex(index),
              );
            },
          ),
        ),
        const SizedBox(height: 20),

        Text(
          "Nearby ${provider.filters[provider.selectedFilterIndex]}",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: const Color(0xFF364856),
          ),
        ),
        const SizedBox(height: 12),

        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredHouses.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final house = filteredHouses[index];
                return HouseCard(model: house);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, int index, String icon, String label) {
    final provider = context.watch<HomeProvider>();
    return GestureDetector(
      onTap: () => provider.setNavIndex(index),
      child: NavigationItem(icon: icon, label: label, isActive: provider.selectedNavIndex == index),
    );
  }
}
