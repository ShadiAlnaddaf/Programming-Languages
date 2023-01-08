class SearchModel {
  SearchModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      SearchModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.experts,
  });

  List<Expert?>? experts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        experts: json["Experts"] == null
            ? []
            : List<Expert?>.from(
                json["Experts"]!.map((x) => Expert.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Experts": experts == null
            ? []
            : List<dynamic>.from(experts!.map((x) => x!.toJson())),
      };
}

class Expert {
  Expert({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.number,
    this.image,
    this.address,
    this.roleId,
    this.walletId,
    this.averageRate,
    this.favourited,
    this.favouriteId,
    this.specialityId,
    this.details,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? number;
  String? image;
  String? address;
  int? roleId;
  int? walletId;
  String? averageRate;
  int? favourited;
  int? favouriteId;
  int? specialityId;
  String? details;

  factory Expert.fromJson(Map<String, dynamic> json) => Expert(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        number: json["number"],
        image: json["image"],
        address: json["address"],
        roleId: json["role_id"],
        walletId: json["wallet_id"],
        averageRate: json["average_rate"],
        favourited: json["favourited"],
        favouriteId: json["favourite_id"],
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
        "favourite_id": favouriteId,
        "speciality_id": specialityId,
        "details": details,
      };
}
