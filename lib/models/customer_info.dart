/*FIXME Unneded code
 import 'dart:convert';

class Customer {
  final String firstName;
  final String lastName;
  final bool isActive;
  final bool isEmailVerified;
  final String userRole;
  final String email;
  final String password;
  final int phone;
  final String userName;
  final String location;
  final String nameOfSalon;
  final int otp;
  Customer({
    this.firstName,
    this.lastName,
    this.isActive,
    this.isEmailVerified,
    this.userRole,
    this.email,
    this.password,
    this.phone,
    this.userName,
    this.location,
    this.nameOfSalon,
    this.otp,
  });


  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'isActive': isActive,
      'isEmailVerified': isEmailVerified,
      'userRole': userRole,
      'email': email,
      'password': password,
      'phone': phone,
      'userName': userName,
      'location': location,
      'nameOfSalon': nameOfSalon,
      'otp': otp,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Customer(
      firstName: map['firstName'],
      lastName: map['lastName'],
      isActive: map['isActive'],
      isEmailVerified: map['isEmailVerified'],
      userRole: map['userRole'],
      email: map['email'],
      password: map['password'],
      phone: map['phone']?.toInt(),
      userName: map['userName'],
      location: map['location'],
      nameOfSalon: map['nameOfSalon'],
      otp: map['otp']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Local(firstName: $firstName, lastName: $lastName, isActive: $isActive, isEmailVerified: $isEmailVerified, userRole: $userRole, email: $email, password: $password, phone: $phone, userName: $userName, location: $location, nameOfSalon: $nameOfSalon, otp: $otp)';
  }
}
 */
// FIXME Reused therefore moved to a separte file
// class Image {
//   final String path;
//   Image({
//     this.path,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'path': path,
//     };
//   }

//   factory Image.fromMap(Map<String, dynamic> map) {
//     if (map == null) return null;

//     return Image(
//       path: map['path'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

//   @override
//   String toString() => 'Image(path: $path)';
// }
