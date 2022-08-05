import 'package:club_member/model/hobby_model.dart';

class MemberModel {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? webUrl;
  String? fbProfile;
  String? lineId;
  String? gender;
  String? birthDate;
  String? address;
  String? addressLine2;
  String? city;
  String? province;
  String? zipCode;
  String? country;
  List<String>? listSourch;
  List<String>? listHobby;
  MemberModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.webUrl,
    this.fbProfile,
    this.lineId,
    this.gender,
    this.birthDate,
    this.address,
    this.addressLine2,
    this.city,
    this.province,
    this.zipCode,
    this.country,
    this.listSourch,
    this.listHobby,
  });
}
