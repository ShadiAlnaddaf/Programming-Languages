class NormalRegisterModel {
  NormalRegisterModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  Data data;

  factory NormalRegisterModel.fromJson(Map<String, dynamic> json) =>
      NormalRegisterModel(
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
    required this.normal,
    required this.token,
  });

  Normal normal;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        normal: Normal.fromJson(json["Normal"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "Normal": normal.toJson(),
        "token": token,
      };
}

class Normal {
  Normal({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.roleId,
    required this.walletId,
    this.phone,
    required this.id,
    this.image,
  });

  String firstName;
  String lastName;
  String email;
  int roleId;
  int walletId;
  String? phone;
  int id;
  String? image;

  factory Normal.fromJson(Map<String, dynamic> json) => Normal(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        roleId: json["role_id"],
        walletId: json["wallet_id"],
        phone: json["phone"],
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "role_id": roleId,
        "wallet_id": walletId,
        "phone": phone,
        "id": id,
        "image": image,
      };
}
