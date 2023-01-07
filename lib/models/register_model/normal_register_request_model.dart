class NormalRegisterRequestModel {
  NormalRegisterRequestModel({
    required this.email,
    required this.password,
    required this.confirm,
    required this.firstName,
    required this.lastName,
    this.image,
    required this.roleId,
    required this.number,
    required this.address
  });

  String email;
  String password;
  String confirm;
  String firstName;
  String lastName;
  String? image;
  int roleId;
  String number;
  String address;

  factory NormalRegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      NormalRegisterRequestModel(
        email: json["email"],
        password: json["password"],
        confirm: json["confirm"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        image: json["image"],
        roleId: json["role_id"],
        number: json["number"],
        address: json["address"]
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "confirm": confirm,
        "firstName": firstName,
        "lastName": lastName,
        "image": image,
        "role_id": roleId,
        "number": number,
        "address": address
      };
}
