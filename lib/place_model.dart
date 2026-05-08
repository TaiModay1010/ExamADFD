class Place {
  final int id;
  final String name;
  final String country;
  final String imageUrl;
  final double rating;

  Place({
    required this.id,
    required this.name,
    required this.country,
    required this.imageUrl,
    required this.rating,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'] as int,
      name: json['name'] as String,
      country: json['country'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
