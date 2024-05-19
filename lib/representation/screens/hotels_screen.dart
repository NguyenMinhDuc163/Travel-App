import 'package:flutter/cupertino.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/item_hotels_widget.dart';

import '../../core/helpers/asset_helper.dart';
import '../../data/models/hotel_model.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});
  static const String routeName = '/hotels_screen';

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {

  final List<HotelModel> listHotel = [
    HotelModel(
      hotelImage: AssetHelper.hotel1,
      hotelName: 'Khách Sạn Majestic Sài Gòn',
      location: 'Quận 1, TP. Hồ Chí Minh',
      awayKilometer: '500 m',
      star: 4.6,
      numberOfReview: 2154,
      price: 150,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel2,
      hotelName: 'Khách Sạn InterContinental Hà Nội',
      location: 'Quận Tây Hồ, Hà Nội',
      awayKilometer: '3 km',
      star: 4.8,
      numberOfReview: 1987,
      price: 210,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel3,
      hotelName: 'Khách Sạn Vinpearl Đà Nẵng',
      location: 'Ngũ Hành Sơn, Đà Nẵng',
      awayKilometer: '1.5 km',
      star: 4.7,
      numberOfReview: 1543,
      price: 180,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel4,
      hotelName: 'Khách Sạn Novotel Phú Quốc',
      location: 'Dương Đông, Phú Quốc',
      awayKilometer: '2 km',
      star: 4.4,
      numberOfReview: 1321,
      price: 170,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel5,
      hotelName: 'Khách Sạn Melia Ba Vì',
      location: 'Ba Vì, Hà Nội',
      awayKilometer: '1.2 km',
      star: 4.5,
      numberOfReview: 897,
      price: 160,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: "Hotels",
      child: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: listHotel.map((e) => ItemHotelWidget(hotelModel: e)).toList(),
            ),
          ))
        ],
      ),
    );
  }
}
