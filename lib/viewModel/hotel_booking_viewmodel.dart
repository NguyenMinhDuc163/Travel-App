import 'package:flutter/cupertino.dart';
import 'package:travel_app/models/hotel_model.dart';

import '../models/flight_model.dart';
import '../models/room_model.dart';
import '../models/user_contact_model.dart';

class HotelBookingViewModel extends ChangeNotifier{
  DateTime? dateStart = DateTime.now();
  DateTime? dateEnd;
  int? guest = 1;
  int? room = 2;
  HotelModel? hotelModel;
  RoomModel? roomModel;
  UserContactModel? userContactModel;
  Flight? flight;

  void setFlight(Flight flight) {
    this.flight = flight;
    notifyListeners();
  }

  void setUserModel(UserContactModel userContactModel) {
    this.userContactModel = userContactModel;
    notifyListeners();
  }
  void setRoomModel(RoomModel roomModel) {
    this.roomModel = roomModel;
    notifyListeners();
  }
  void setHotelModel(HotelModel hotelModel) {
    this.hotelModel = hotelModel;
    notifyListeners();
  }

  void setDate(DateTime dateStart, DateTime dateEnd) {
    this.dateStart = dateStart;
    this.dateEnd = dateEnd;
    notifyListeners();
  }


  void setRoom(int room) {
    this.room = room;
    notifyListeners();
  }

  void setGuest(int guest) {
    this.guest = guest;
    notifyListeners();
  }
}