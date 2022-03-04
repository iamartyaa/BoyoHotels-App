class Hotel {
  final String id;
  final String cityId;
  final String name;
  final String address;
  final double rating;
  final List<String> amenities;
  final String img;
  final int rooms;

  const Hotel({
    required this.id,
    required this.cityId,
    required this.name,
    required this.address,
    required this.rating,
    required this.amenities,
    required this.rooms,
    required this.img,
  });
}
