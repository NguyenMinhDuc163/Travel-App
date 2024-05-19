import 'package:flutter/cupertino.dart';

import '../data/models/hotel_model.dart';
import '../data/models/room_model.dart';
import '../data/models/user_contact_model.dart';

class HotelBookingProvider extends ChangeNotifier{
  DateTime? dateStart;
  DateTime? dateEnd;
  int? guest = 1;
  int? room = 2;
  HotelModel? hotelModel;
  RoomModel? roomModel;
  UserContactModel? userContactModel;

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