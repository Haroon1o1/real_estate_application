class HouseModel {
  final String title;
  final String rent;
  final String location;
  final String image;
  final List<Map<String, String>> gallery; // 👈 keep as List of Maps
  final bool isVerified;
  final List<String> reviews;
  final double ratings;
  final String category;
  final int bedrooms;
  final int bathrooms;
  final int area;
  final int buildYear;
  final int livingRooms;
  final int garage;
  final String note;
  final List<String> publicFacilities;

  HouseModel({
    required this.title,
    required this.rent,
    required this.location,
    required this.image,
    required this.gallery,
    required this.isVerified,
    required this.reviews,
    required this.ratings,
    required this.category,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.buildYear,
    required this.livingRooms,
    required this.garage,
    required this.note,
    required this.publicFacilities,
  });

  factory HouseModel.fromJson(Map<String, dynamic> json) {
    return HouseModel(
      title: json['title'] ?? '',
      rent: json['rent'] ?? '',
      location: json['location'] ?? '',
      image: json['image'] ?? '',
      gallery: (json['gallery'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(), // ✅ FIX: force Map<String, String>
      isVerified: json['isVerified'] ?? false,
      reviews: List<String>.from(json['reviews'] ?? []),
      ratings: (json['ratings'] as num).toDouble(),
      category: json['category'] ?? '',
      bedrooms: json['bedrooms'] ?? 0,
      bathrooms: json['bathrooms'] ?? 0,
      area: json['area'] ?? 0,
      buildYear: json['buildYear'] ?? 0,
      livingRooms: json['livingRooms'] ?? 0,
      garage: json['garage'] ?? 0,
      note: json['note'] ?? '',
      publicFacilities: List<String>.from(json['publicFacilities'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'rent': rent,
      'location': location,
      'image': image,
      'gallery': gallery,
      'isVerified': isVerified,
      'reviews': reviews,
      'ratings': ratings,
      'category': category,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
      'buildYear': buildYear,
      'livingRooms': livingRooms,
      'garage': garage,
      'note': note,
      'publicFacilities': publicFacilities,
    };
  }
}
