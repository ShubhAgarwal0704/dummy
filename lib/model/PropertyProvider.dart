import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PropertyModel {
  final int id;
  final List<RoomDetail> roomDetail;
  final List<PropertyAmenity> pptyAmenity;
  final String propertyType;
  final String avlFor;
  final String nearCollege;
  final String messFacility;
  final String rntPayDuration;
  final String propertyName;
  final String phoneNo;
  final int startingPrice;
  final String address1;
  final String address2;
  final String city;
  final String state;
  final int zipCode;
  final String country;
  final double distFromCollege;
  final int securityCharges;
  final Map<String, dynamic> securityFeatures;
  final Map<String, dynamic> lifestyle;
  final Map<String, dynamic> rules;
  final String description;
  final String? coverImage;
  final String? owner;

  PropertyModel({
    required this.id,
    required this.roomDetail,
    required this.pptyAmenity,
    required this.propertyType,
    required this.avlFor,
    required this.nearCollege,
    required this.messFacility,
    required this.rntPayDuration,
    required this.propertyName,
    required this.phoneNo,
    required this.startingPrice,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.distFromCollege,
    required this.securityCharges,
    required this.securityFeatures,
    required this.lifestyle,
    required this.rules,
    required this.description,
    this.coverImage,
    this.owner,
  });
}

class RoomDetail {
  final int id;
  final List<RoomAmenity> roomAmnt;
  final String seater;
  final String furnished;
  final String kitchen;
  final String washroom;
  final int totalRooms;
  final int occupiedRooms;
  final int price;
  final int ppty;

  RoomDetail({
    required this.id,
    required this.roomAmnt,
    required this.seater,
    required this.furnished,
    required this.kitchen,
    required this.washroom,
    required this.totalRooms,
    required this.occupiedRooms,
    required this.price,
    required this.ppty,
  });
}

class RoomAmenity {
  final int id;
  final String amenityName;

  RoomAmenity({
    required this.id,
    required this.amenityName,
  });
}

class PropertyAmenity {
  final int id;
  final String amenityName;

  PropertyAmenity({
    required this.id,
    required this.amenityName,
  });
}

class PropertyProvider with ChangeNotifier {
  List<PropertyModel> _userList = [];

  List<PropertyModel> get propList {
    return [..._userList];
  }

  Future<void> getUserApi() async {
    try {
      final response = await http.get(Uri.parse(
          'https://mocki.io/v1/76d63c12-7be7-4bf2-b73b-96c8e719d375'));
      final extractedData = json.decode(response.body) as List<dynamic>;
      final List<PropertyModel> loadedProperty = [];

      for (var propData in extractedData) {
        List<RoomDetail> roomDetails =
            (propData['roomDetail'] as List<dynamic>).map((roomData) {
          List<RoomAmenity> roomAmenities =
              (roomData['roomAmnt'] as List<dynamic>).map((amenityData) {
            return RoomAmenity(
              id: amenityData['id'],
              amenityName: amenityData['amenityName'],
            );
          }).toList();

          return RoomDetail(
            id: roomData['id'],
            roomAmnt: roomAmenities,
            seater: roomData['seater'],
            furnished: roomData['furnished'],
            kitchen: roomData['kitchen'],
            washroom: roomData['washroom'],
            totalRooms: roomData['totalRooms'],
            occupiedRooms: roomData['occupiedRooms'],
            price: roomData['price'],
            ppty: roomData['ppty'],
          );
        }).toList();

        List<PropertyAmenity> propertyAmenities =
            (propData['pptyAmenity'] as List<dynamic>).map((amenityData) {
          return PropertyAmenity(
            id: amenityData['id'],
            amenityName: amenityData['amenityName'],
          );
        }).toList();

        loadedProperty.add(
          PropertyModel(
            id: propData['id'],
            roomDetail: roomDetails,
            pptyAmenity: propertyAmenities,
            propertyType: propData['propertyType'],
            avlFor: propData['avlFor'],
            nearCollege: propData['nearCollege'],
            messFacility: propData['messFacility'],
            rntPayDuration: propData['rntPayDuration'],
            propertyName: propData['propertyName'],
            phoneNo: propData['phoneNo'],
            startingPrice: propData['startingPrice'],
            address1: propData['address1'],
            address2: propData['address2'],
            city: propData['city'],
            state: propData['state'],
            zipCode: propData['zipCode'],
            country: propData['country'],
            distFromCollege: propData['distFromCollege'],
            securityCharges: propData['securityCharges'],
            securityFeatures: propData['securityFeatures'],
            lifestyle: propData['lifestyle'],
            rules: propData['rules'],
            description: propData['description'],
            coverImage: propData['coverImage'],
            owner: propData['owner'],
          ),
        );
      }

      _userList = loadedProperty;
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
