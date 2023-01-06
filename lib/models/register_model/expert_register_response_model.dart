class ExpertRegisterResponseModel {
  ExpertRegisterResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  Data? data;

  factory ExpertRegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      ExpertRegisterResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.expert,
    required this.token,
  });

  Expert expert;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        expert: Expert.fromJson(json["Expert"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "Expert": expert.toJson(),
        "token": token,
      };
}

class Expert {
  Expert({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.roleId,
    required this.walletId,
    required this.number,
    required this.address,
    this.image,
    required this.id,
  });

  String firstName;
  String lastName;
  String email;
  int roleId;
  int walletId;
  String number;
  String address;
  String? image;
  int id;

  factory Expert.fromJson(Map<String, dynamic> json) => Expert(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        roleId: json["role_id"],
        walletId: json["wallet_id"],
        number: json["number"],
        address: json["address"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "role_id": roleId,
        "wallet_id": walletId,
        "number": number,
        "address": address,
        "image": image,
        "id": id,
      };
}
