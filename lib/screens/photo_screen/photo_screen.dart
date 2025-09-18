import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_application/screens/photo_screen/provider/photo_provider.dart';
import 'package:real_estate_application/screens/photo_screen/widgets/poster.dart';

/// Dummy data
final List<Map<String, dynamic>> dummyMovies = [
  {"title": "Out door", "img": "assets/images/house1.jpg"},
  {"title": "In Door", "img": "assets/images/house2.jpg"},
  {"title": "Lawn", "img": "assets/images/house3.jpg"},
  {"title": "Roof", "img": "assets/images/house4.jpg"},
];

class PhotosScreen extends StatelessWidget {
  PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final photoProvider = context.watch<PhotoProvider>();

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "House's Gallery",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),

            /// Main Posters
            SizedBox(
              height: size.height * 0.7,
              child: PageView.builder(
                controller: photoProvider.pageController,
                physics: BouncingScrollPhysics(),
                itemCount: dummyMovies.length,
                itemBuilder: (context, index) {
                  final item = dummyMovies[index];
                  final value = index - photoProvider.currentPage;
                  final scale = 1 - (value.abs() * 0.1);
                  final highlight = value.abs() < 0.6;

                  return Transform.scale(
                    scale: scale.clamp(0.9, 1.0),
                    child: PosterWidget(item: item, highlight: highlight),
                  );
                },
              ),
            ),

            SizedBox(height: 16),

            /// Thumbnails row
            /// Thumbnails row
            Center(
              child: SizedBox(
                height: size.height * 0.1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(dummyMovies.length, (index) {
                      final item = dummyMovies[index];
                      final isSelected = index == photoProvider.currentPage.round();

                      return GestureDetector(
                        onTap: () {
                          photoProvider.jumpToPage(index);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: isSelected ? 1.0 : 0.5, // highlight selected
                              child: Image.asset(
                                item["img"],
                                fit: BoxFit.cover,
                                width: 70,
                                height: 70,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
