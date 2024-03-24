class Place {
  Place(
      {required this.name,
      required this.location,
      required this.latitude,
      required this.longitude,
      required this.description,
      required this.categories,
      required this.rating,
      required this.image,
      required this.reviews});

  final String name;
  final String location;
  final double latitude;
  final double longitude;
  final String description;
  final List<dynamic> categories;
  final double rating;
  final String image;
  final List<dynamic> reviews;
}
