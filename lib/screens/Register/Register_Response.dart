/// name : "ahmed Mohmad Mahmoud"
/// emaill : "ahmed.20375527@compit.aun.edu.eg"
/// Password : "1234"
/// RePassword : "1234"
/// PhoneNumber : "01019742211"

// class RegisterResponse {
//   RegisterResponse({
//       this.name,
//       this.emaill,
//       this.password,
//       this.rePassword,
//       this.phoneNumber,});
//
//   RegisterResponse.fromJson(dynamic json) {
//     name = json['name'];
//     emaill = json['emaill'];
//     password = json['Password'];
//     rePassword = json['RePassword'];
//     phoneNumber = json['PhoneNumber'];
//   }
//   String? name;
//   String? emaill;
//   String? password;
//   String? rePassword;
//   String? phoneNumber;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['name'] = name;
//     map['emaill'] = emaill;
//     map['Password'] = password;
//     map['RePassword'] = rePassword;
//     map['PhoneNumber'] = phoneNumber;
//     return map;
//   }
//
// }
class RegisterResponse {
  RegisterResponse({
    this.name,
    this.emaill,
    this.password,
    this.rePassword,
    this.phoneNumber,
    this.errorMessages});

  RegisterResponse.fromJson(dynamic json) {
    name = json['name'];
    emaill = json['emaill'];
    password = json['Password'];
    rePassword = json['RePassword'];
    phoneNumber = json['PhoneNumber'];
  }

  String? name;
  String? emaill;
  String? password;
  String? rePassword;
  String? phoneNumber;
  List<String>? errorMessages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['emaill'] = emaill;
    map['Password'] = password;
    map['RePassword'] = rePassword;
    map['PhoneNumber'] = phoneNumber;
    return map;
  }
}

