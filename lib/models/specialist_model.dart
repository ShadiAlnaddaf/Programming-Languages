
class SpecialistModel {
  SpecialistModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  Data data;

  factory SpecialistModel.fromJson(Map<String, dynamic> json) => SpecialistModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.experts,
  });

  List<Expert> experts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    experts: List<Expert>.from(json["experts"].map((x) => Expert.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "experts": List<dynamic>.from(experts.map((x) => x.toJson())),
  };
}

class Expert {
  Expert({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.number,
     this.image = '',
    required this.address,
    required this.roleId,
    required this.walletId,
    this.averageRate='0.0',
    this.favourited=0,
    required this.specialityId,
    required this.details,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String number;
  String image;
  String address;
  int roleId;
  int walletId;
  String averageRate;
  int favourited;
  int specialityId;
  String details;
  factory Expert.fromJson(Map<String, dynamic> json) => Expert(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    number: json["number"],
    image: json["image"]??'',
    address: json["address"] ??"Null",
    roleId: json["role_id"],
    walletId: json["wallet_id"],
    averageRate: json["average_rate"] ?? "0.0",
    favourited: json["favourited"]?? 0,
    specialityId: json["speciality_id"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "number": number,
    "image": image,
    "address": address,
    "role_id": roleId,
    "wallet_id": walletId,
    "average_rate": averageRate,
    "favourited": favourited,
  };
}
