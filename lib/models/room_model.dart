class RoomModel {
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

  final String roomImage;
  final String roomName;
  final String utility;
  final int size;
  final int price;
}
