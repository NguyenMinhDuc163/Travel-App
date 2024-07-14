

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../models/flight_model.dart';
import '../models/hotel_model.dart';
import '../models/room_model.dart';
import '../models/user_contact_model.dart';
import '../models/user_model.dart';
import '../res/core/constants/app_urls.dart';

class DataRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<UserModel> fetchUser(String userId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse('${AppUrls.apiDemo}/$userId');
      return UserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserContactModel> fetchUserContact(String contactId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse('${AppUrls.apiDemo}/$contactId');
      return UserContactModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<RoomModel> fetchRoom(String roomId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse('${AppUrls.apiDemo}/$roomId');
      return RoomModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<HotelModel> fetchHotel(String hotelId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse('${AppUrls.apiDemo}/$hotelId');
      return HotelModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Flight> fetchFlight(String flightId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse('${AppUrls.apiDemo}/$flightId');
      return Flight.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
