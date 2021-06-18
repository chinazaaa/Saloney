import 'dart:convert';

import 'api_response_variants/customer_login_response.dart';
import 'api_response_variants/salon_login_response.dart';

class Cache {
  CustomerLoginResponse customer;
  SalonLoginResponse salon;

  bool get isCustomer => customer != null;

  ///Please use only one input at a time
  Cache({CustomerLoginResponse customer, SalonLoginResponse salon}) {

    print(salon);
    // //Check if is saloon or customer
    // if (salon != null) {
    //   this.isCustomer = false;
    // }  else {
    //   isCustomer = true;
    // }

    this.customer = customer;
    this.salon = salon;
  }

  factory Cache.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    // print(map['salon']);
    // print(map['customer']);
    return Cache(
      customer: map['customer'] != null
          ? CustomerLoginResponse.fromJson(map['customer'])
          : null,
      salon: map['salon'] != null
          ? SalonLoginResponse.fromJson(map['salon'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cache.fromJson(String source) => Cache.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'customer': customer,
      'salon': salon,
      'isCustomer': isCustomer,
    };
  }
}