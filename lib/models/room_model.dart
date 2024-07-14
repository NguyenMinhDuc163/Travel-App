class RoomModel {
  final String roomImage;
  final String roomName;
  final String utility;
  final int size;
  final int price;

  RoomModel({
    required this.roomImage,
    required this.roomName,
    required this.utility,
    required this.size,
    required this.price,
  });

  @override
  String toString() {
    return 'RoomModel{roomImage: $roomImage, roomName: $roomName, utility: $utility, size: $size, price: $price}';
  }

  // Thêm phương thức fromJson
  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      roomImage: json['roomImage'],
      roomName: json['roomName'],
      utility: json['utility'],
      size: json['size'],
      price: json['price'],
    );
  }

  // Thêm phương thức toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomImage'] = roomImage;
    data['roomName'] = roomName;
    data['utility'] = utility;
    data['size'] = size;
    data['price'] = price;
    return data;
  }
}
