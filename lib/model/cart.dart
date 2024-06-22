import 'package:flutter/material.dart';
import 'package:hotel_app/model/hotel.dart';
import 'package:hotel_app/model/PropertyProvider.dart';

class Cart extends ChangeNotifier {
  List<Hotel> userCart = [];

  static List<Hotel> hotelList = <Hotel>[
    Hotel(
      imagePath: 'assets/hotel/hotel_1.png',
      titleTxt: 'Muskan PG',
      subTxt: '1/2/3 Seater',
      address: "Muradnagar",
      about:
          "Nestled in the city of sunshine, Hyatt Regency Harare The Meikles offers iconic architecture, charm, luxury, and easy access to major attractions.",
      dist: 0.2,
      reviews: 2534,
      rating: 4.4,
      perMonth: 9000,
      facilities: ["AC", "Cooler", "Wifi", "Mattress", "Power Backup"],
    ),
    Hotel(
      imagePath: 'assets/hotel/hotel_2.png',
      titleTxt: 'Nikil PG',
      subTxt: '1/2/3 Seater',
      address: "Muradnagar",
      about:
          "Situated in Zimbabwe's sunny capital Harare, it is a golden icon on the city skyline. The luxurious 304 roomed Rainbow Towers Hotel & International Conference ",
      dist: 0.3,
      reviews: 74,
      rating: 4.1,
      perMonth: 7500,
      facilities: ["AC", "Cooler", "Wifi", "Mattress", "Power Backup"],
    ),
    Hotel(
      imagePath: 'assets/hotel/hotel_3.png',
      titleTxt: 'RadheShyam',
      subTxt: '1/2/3 Seater',
      address: "Muradnagar",
      about:
          "Located 100m from the country's main financial and corporate district and boasting an array of fully equipped conference rooms, ",
      dist: 0.8,
      reviews: 62,
      rating: 4.1,
      perMonth: 6900,
      facilities: ["AC", "Cooler", "Wifi", "Mattress", "Power Backup"],
    ),
    Hotel(
      imagePath: 'assets/hotel/hotel_4.png',
      titleTxt: 'Tagore Hostel',
      subTxt: '1/2/3 Seater',
      address: "KIET College",
      about:
          "Centrally located in the Avenues, within walking distance of downtown Harare, The Bronte offers well appointed rooms and executive suites in an idyllic garden ",
      dist: 0.0,
      reviews: 1682,
      rating: 4.2,
      perMonth: 8000,
      facilities: ["AC", "Cooler", "Wifi", "Mattress", "Power Backup"],
    ),
    Hotel(
      imagePath: 'assets/hotel/hotel_5.png',
      titleTxt: 'Gargi Hostel',
      subTxt: '1/2/3 Seater',
      address: "KIET College",
      about:
          "Warm African hospitality. Set in tranquil surroundings on the outskirts of the country's dynamic capital is the beautiful Cresta Lodge - Harare ",
      dist: 0.0,
      reviews: 1682,
      rating: 4.5,
      perMonth: 8500,
      facilities: ["AC", "Cooler", "Wifi", "Mattress", "Power Backup"],
    ),
  ];

  List<Hotel> getUserCart() {
    return userCart;
  }

  List<Hotel> getHotels() {
    return hotelList;
  }

  void addHotelToCart(Hotel hotel) {
    userCart.add(hotel);
    notifyListeners();
  }

  void updateHotel(Hotel oldHotel, Hotel newHotel) {
    hotelList.remove(oldHotel);
    hotelList.add(newHotel);
    notifyListeners();
  }

  void removeHotelFromCart(Hotel hotel) {
    userCart.remove(hotel);
    notifyListeners();
  }
}

// class Property extends ChangeNotifier {
//   List<PropertyModel> propertyList = <PropertyModel>[
//     PropertyModel(
//         user: user,
//         phoneNo: phoneNo,
//         pgName: pgName,
//         roomDetails: roomDetails,
//         propertyType: propertyType,
//         avlFor: avlFor,
//         location: location,
//         pptyAmenties: pptyAmenties,
//         distFromCollege: distFromCollege,
//         addCharges: addCharges,
//         securityCharges: securityCharges,
//         rntPayDuration: rntPayDuration,
//         securityFeatures: securityFeatures,
//         billIncluded: billIncluded,
//         lifestyle: lifestyle,
//         messFacility: messFacility,
//         accessibility: accessibility,
//         pptDetails: pptDetails,
//         rules: rules,
//         description: description,
//         coverImageUrl: coverImageUrl)
//   ];
// }
