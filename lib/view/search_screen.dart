import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/hotel_model.dart';
import '../res/core/constants/dimension_constants.dart';
import '../res/core/helpers/asset_helper.dart';
import '../res/widget/app_bar_container.dart';
import '../res/widget/item_hotels_widget.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const String routeName = '/search_screen';
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

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
  // Thêm các khách sạn mới
  HotelModel(
    hotelImage: AssetHelper.hotel1,
    hotelName: 'Khách Sạn Sofitel Legend Metropole Hà Nội',
    location: 'Quận Hoàn Kiếm, Hà Nội',
    awayKilometer: '1 km',
    star: 4.9,
    numberOfReview: 2543,
    price: 300,
  ),
  HotelModel(
    hotelImage: AssetHelper.hotel2,
    hotelName: 'Khách Sạn Mường Thanh Luxury Quảng Ninh',
    location: 'Thành phố Hạ Long, Quảng Ninh',
    awayKilometer: '2 km',
    star: 4.7,
    numberOfReview: 1921,
    price: 180,
  ),
  HotelModel(
    hotelImage: AssetHelper.hotel3,
    hotelName: 'Khách Sạn Vinpearl Hải Phòng',
    location: 'Quận Hồng Bàng, Hải Phòng',
    awayKilometer: '3 km',
    star: 4.5,
    numberOfReview: 1423,
    price: 190,
  ),
  HotelModel(
    hotelImage: AssetHelper.hotel1,
    hotelName: 'Khách Sạn Imperial Huế',
    location: 'Thành phố Huế, Thừa Thiên Huế',
    awayKilometer: '1.5 km',
    star: 4.6,
    numberOfReview: 1104,
    price: 160,
  ),
  HotelModel(
    hotelImage: AssetHelper.hotel5,
    hotelName: 'Khách Sạn Pullman Vũng Tàu',
    location: 'Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu',
    awayKilometer: '500 m',
    star: 4.8,
    numberOfReview: 1850,
    price: 200,
  ),
  HotelModel(
    hotelImage: AssetHelper.hotel4,
    hotelName: 'Khách Sạn Lotte Hà Nội',
    location: 'Quận Ba Đình, Hà Nội',
    awayKilometer: '2 km',
    star: 4.7,
    numberOfReview: 2345,
    price: 220,
  ),
];

class _SearchScreenState extends State<SearchScreen> {
  List<HotelModel> _filteredHotels = listHotel;

  void _filterHotels(String query) {
    final queryWithoutDiacritics = removeDiacritics(query.toLowerCase());
    final filtered = listHotel.where((hotel) {
      final hotelNameWithoutDiacritics = removeDiacritics(hotel.hotelName.toLowerCase());

      return hotelNameWithoutDiacritics.contains(queryWithoutDiacritics);
    }).toList();

    setState(() {
      _filteredHotels = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: "Search Screen",
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kDefaultPadding,
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(bottom: kDefaultPadding),
              child: TextField(
                style: const TextStyle(fontSize: 14, color: Colors.black87), // màu chữ khi người dùng nhập
                decoration: InputDecoration(
                  hintText: 'Search for a hotel',
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                  labelStyle: TextStyle(fontSize: 14, color: Colors.white),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.black38,
                      size: 24,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        kItemPadding,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
                ),
                onChanged: _filterHotels,
              ),
            ),
            Column(
              children: _filteredHotels.map((e) => ItemHotelWidget(hotelModel: e)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
