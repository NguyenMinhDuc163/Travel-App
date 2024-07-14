class HotelModel {
  final String hotelImage;
  final String hotelName;
  final String location;
  final String awayKilometer;
  final double star;
  final int numberOfReview;
  final int price;

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

  // Thêm phương thức fromJson
  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      hotelImage: json['hotelImage'],
      hotelName: json['hotelName'],
      location: json['location'],
      awayKilometer: json['awayKilometer'],
      star: json['star'].toDouble(), // Đảm bảo chuyển đổi sang double
      numberOfReview: json['numberOfReview'],
      price: json['price'],
    );
  }

  // Thêm phương thức toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotelImage'] = hotelImage;
    data['hotelName'] = hotelName;
    data['location'] = location;
    data['awayKilometer'] = awayKilometer;
    data['star'] = star;
    data['numberOfReview'] = numberOfReview;
    data['price'] = price;
    return data;
  }
}
