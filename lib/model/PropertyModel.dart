// class PropertyModel {
//   final int id;
//   final List<RoomDetail> roomDetail;
//   final List<PropertyAmenity> pptyAmenity;
//   final String propertyType;
//   final String avlFor;
//   final String nearCollege;
//   final String messFacility;
//   final String rntPayDuration;
//   final String propertyName;
//   final String phoneNo;
//   final int startingPrice;
//   final String address1;
//   final String address2;
//   final String city;
//   final String state;
//   final int zipCode;
//   final String country;
//   final double distFromCollege;
//   final int securityCharges;
//   final Map<String, dynamic> securityFeatures;
//   final Map<String, dynamic> lifestyle;
//   final Map<String, dynamic> rules;
//   final String description;
//   final String? coverImage;
//   final String? owner;

//   PropertyModel({
//     required this.id,
//     required this.roomDetail,
//     required this.pptyAmenity,
//     required this.propertyType,
//     required this.avlFor,
//     required this.nearCollege,
//     required this.messFacility,
//     required this.rntPayDuration,
//     required this.propertyName,
//     required this.phoneNo,
//     required this.startingPrice,
//     required this.address1,
//     required this.address2,
//     required this.city,
//     required this.state,
//     required this.zipCode,
//     required this.country,
//     required this.distFromCollege,
//     required this.securityCharges,
//     required this.securityFeatures,
//     required this.lifestyle,
//     required this.rules,
//     required this.description,
//     this.coverImage,
//     this.owner,
//   });

//   factory PropertyModel.fromJson(dynamic json) {
//     var roomDetailFromJson = json['room_detail'] as List;
//     List<RoomDetail> roomDetailList =
//         roomDetailFromJson.map((i) => RoomDetail.fromJson(i)).toList();

//     var pptyAmenityFromJson = json['ppty_amenity'] as List;
//     List<PropertyAmenity> pptyAmenityList =
//         pptyAmenityFromJson.map((i) => PropertyAmenity.fromJson(i)).toList();

//     return PropertyModel(
//       id: json['id'],
//       roomDetail: roomDetailList,
//       pptyAmenity: pptyAmenityList,
//       propertyType: json['property_type'],
//       avlFor: json['avl_for'],
//       nearCollege: json['near_college'],
//       messFacility: json['mess_facility'],
//       rntPayDuration: json['rnt_pay_duration'],
//       propertyName: json['property_name'],
//       phoneNo: json['phone_no'],
//       startingPrice: json['starting_price'],
//       address1: json['address1'],
//       address2: json['address2'],
//       city: json['city'],
//       state: json['state'],
//       zipCode: json['zip_code'],
//       country: json['country'],
//       distFromCollege: json['dist_from_college'],
//       securityCharges: json['security_charges'],
//       securityFeatures: json['security_features'],
//       lifestyle: json['lifestyle'],
//       rules: json['rules'],
//       description: json['description'],
//       coverImage: json['cover_image'],
//       owner: json['owner'],
//     );
//   }
// }

// class RoomDetail {
//   final int id;
//   final List<RoomAmenity> roomAmnt;
//   final String seater;
//   final String furnished;
//   final String kitchen;
//   final String washroom;
//   final int totalRooms;
//   final int occupiedRooms;
//   final int price;
//   final int ppty;

//   RoomDetail({
//     required this.id,
//     required this.roomAmnt,
//     required this.seater,
//     required this.furnished,
//     required this.kitchen,
//     required this.washroom,
//     required this.totalRooms,
//     required this.occupiedRooms,
//     required this.price,
//     required this.ppty,
//   });

//   factory RoomDetail.fromJson(dynamic json) {
//     var roomAmntFromJson = json['room_amnt'] as List;
//     List<RoomAmenity> roomAmntList =
//         roomAmntFromJson.map((i) => RoomAmenity.fromJson(i)).toList();

//     return RoomDetail(
//       id: json['id'],
//       roomAmnt: roomAmntList,
//       seater: json['seater'],
//       furnished: json['furnished'],
//       kitchen: json['kitchen'],
//       washroom: json['washroom'],
//       totalRooms: json['total_rooms'],
//       occupiedRooms: json['occupied_rooms'],
//       price: json['price'],
//       ppty: json['ppty'],
//     );
//   }
// }

// class RoomAmenity {
//   final int id;
//   final String amenityName;

//   RoomAmenity({
//     required this.id,
//     required this.amenityName,
//   });

//   factory RoomAmenity.fromJson(dynamic json) {
//     return RoomAmenity(
//       id: json['id'],
//       amenityName: json['amenity_name'],
//     );
//   }
// }

// class PropertyAmenity {
//   final int id;
//   final String amenityName;

//   PropertyAmenity({
//     required this.id,
//     required this.amenityName,
//   });

//   factory PropertyAmenity.fromJson(dynamic json) {
//     return PropertyAmenity(
//       id: json['id'],
//       amenityName: json['amenity_name'],
//     );
//   }
//   // List<PropertyModel> userList = [];

//   // Future<List<PropertyModel>> getUserApi() async {
//   //   final response = await http.get(
//   //       Uri.parse('https://mocki.io/v1/76d63c12-7be7-4bf2-b73b-96c8e719d375'));
//   //   var data = jsonDecode(response.body.toString());
//   //   if (response.statusCode == 200) {
//   //     userList.clear();
//   //     print(response.body);
//   //     for (Map i in data) {
//   //       userList.add(PropertyModel.fromJson(i));
//   //     }
//   //     return userList;
//   //   } else {
//   //     return userList;
//   //   }
//   // }
// }
