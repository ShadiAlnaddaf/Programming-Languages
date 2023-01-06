import 'dart:io';

class ExpertRegisterRequestModel {
  ExpertRegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirm,
    required this.roleId,
    required this.number,
    required this.address,
    required this.days,
    required this.specialities,
  });

  String firstName;
  String lastName;
  String email;
  String password;
  String confirm;
  int roleId;
  String number;
  String address;
  List<Day> days;
  List<Speciality> specialities;

  factory ExpertRegisterRequestModel.fromJson(Map<String, dynamic> json) => ExpertRegisterRequestModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    confirm: json["confirm"],
    roleId: json["role_id"],
    number: json["number"],
    address: json["address"],
    days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
    specialities: List<Speciality>.from(json["specialities"].map((x) => Speciality.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "confirm": confirm,
    "role_id": roleId,
    "number": number,
    "address": address,
    "days": List<dynamic>.from(days.map((x) => x.toJson())),
    "specialities": List<dynamic>.from(specialities.map((x) => x.toJson())),
  };
}

class Day {
  Day({
    required this.dayId,
    required this.startTime,
    required this.endTime,
  });

  int dayId;
  int startTime;
  int endTime;


  @override
  String toString() {
    return 'Day{dayId: $dayId, startTime: $startTime, endTime: $endTime}';
  }

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    dayId: json["day_id"],
    startTime: json["startTime"],
    endTime: json["endTime"],
  );

  Map<String, dynamic> toJson() => {
    "day_id": dayId,
    "startTime": startTime,
    "endTime": endTime,
  };
}

class Speciality {
  Speciality({
    required this.specialityId,
     this.details,
  });

  int specialityId;
  String? details;

  factory Speciality.fromJson(Map<String, dynamic> json) => Speciality(
    specialityId: json["speciality_id"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "speciality_id": specialityId,
    "details": details,
  };
}
