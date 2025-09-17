import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Dummy data
final List<Map<String, dynamic>> dummyMovies = [
  {
    "title": "Inception",
    "img": "assets/images/house1.jpg",
    "genre": ["Sci-Fi", "Thriller"],
  },
  {
    "title": "Interstellar",
    "img": "assets/images/house2.jpg",
    "genre": ["Sci-Fi", "Drama"],
  },
  {
    "title": "The Dark Knight",
    "img": "assets/images/house3.jpg",
    "genre": ["Action", "Crime"],
  },
  {
    "title": "The Dark Knight",
    "img": "assets/images/house4.jpg",
    "genre": ["Action", "Crime"],
  },
];

class PhotosScreen extends StatefulWidget {
  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
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
      body: Center(
        child: Container(
          height: size.height * 0.6,
          padding: EdgeInsets.symmetric(vertical: 0),
          child: PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: dummyMovies.length,
            itemBuilder: (context, index) {
              final item = dummyMovies[index];
              final value = (index - _currentPage);
              final scale = 1 - (value.abs() * 0.1);
              final highlight = value.abs() < 0.6;

              return Transform.scale(
                scale: scale.clamp(0.9, 1.0),
                child: PosterWidget(item: item, highlight: highlight),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PosterWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool highlight;

  const PosterWidget({super.key, required this.item, required this.highlight});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: h * 0.5,
      // width: w * 0.8,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        boxShadow: highlight
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  offset: const Offset(3, 6),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ]
            : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(item["img"], fit: BoxFit.fill),
      ),
    );
  }
}
