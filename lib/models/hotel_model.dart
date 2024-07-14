class HotelModel {
  HotelModel({
    required this.hotelImage,
    required this.hotelName,
    required this.location,
    required this.awayKilometer,
    required this.star,
    required this.numberOfReview,
    required this.price,
  });

  @override
  String toString() {
    return 'HotelModel{hotelImage: $hotelImage, hotelName: $hotelName, location: $location, awayKilometer: $awayKilometer, star: $star, numberOfReview: $numberOfReview, price: $price}';
  }

  final String hotelImage;
  final String hotelName;
  final String location;
  final String awayKilometer;
  final double star;
  final int numberOfReview;
  final int price;
}
