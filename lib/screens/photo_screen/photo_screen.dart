import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_application/models/HouseModel.dart';
import 'package:real_estate_application/screens/photo_screen/provider/photo_provider.dart';
import 'package:real_estate_application/screens/photo_screen/widgets/poster.dart';

/// Dummy data
class HouseGallery extends StatelessWidget {
  final HouseModel model;
  HouseGallery({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final photoProvider = context.watch<PhotoProvider>();

    final galleryItems = model.gallery; // [{name:..., url:...}, ...]

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
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
          children: [
            const SizedBox(height: 10),

            /// Main Posters
            SizedBox(
              height: size.height * 0.7,
              child: PageView.builder(
                controller: photoProvider.pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: galleryItems.length,
                itemBuilder: (context, index) {
                  final item = galleryItems[index];
                  final value = index - photoProvider.currentPage;
                  final scale = 1 - (value.abs() * 0.1);
                  final highlight = value.abs() < 0.6;

                  return Transform.scale(
                    scale: scale.clamp(0.9, 1.0),
                    child: PosterWidget(
                      item: {
                        "title": item["name"],
                        "img": item["url"], // ✅ FIXED
                      },
                      highlight: highlight,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            /// Thumbnails
            Center(
              child: SizedBox(
                height: size.height * 0.1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(galleryItems.length, (index) {
                      final item = galleryItems[index];
                      final isSelected = index == photoProvider.currentPage.round();

                      return GestureDetector(
                        onTap: () => photoProvider.jumpToPage(index),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity: isSelected ? 1.0 : 0.5,
                              child: Image.asset(
                                item["url"]!, // ✅ FIXED
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
