import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_project/models/api_response_variants/customer_login_response.dart';
import 'package:starter_project/models/api_response_variants/customer_registration_response.dart';
import 'package:starter_project/models/api_response_variants/salon_login_response.dart';
import 'package:starter_project/models/api_response_variants/salon_registration_response.dart';

//-- How to use --
/* var userInfoCache = locator<UserInfoCache>();
  await userInfoCache.getUserDataFromStorage();
  print('used data: ${userInfoCache.name}');
*/

class Cache{
  CustomerLoginResponse customer;
  SalonLoginResponse salon;
  bool isCustomer;

  ///Please use only one input at a time
  Cache({CustomerLoginResponse customer, SalonLoginResponse salon}){
    //Check if is saloon or customer
    if (salon != null) {
      this.isCustomer = false;
    }  else {
      isCustomer = true;
    }

    this.customer = customer;
    this.salon = salon;
  }

  factory Cache.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    print(map['salon']);

    return Cache(
      customer: CustomerLoginResponse.fromMap(map['customer']),
      salon: SalonLoginResponse.fromMap(map['salon']),
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

///This class is used to sync User Data
class UserInfoCache {
  //Objects used to set data
  Cache cache;
  //getters
  CustomerLoginResponse get customer => cache.customer;
  SalonLoginResponse get salon => cache.salon;


  //--token
  String get token => this.cache.isCustomer ? this.cache.customer.data.api_token : this.cache.salon.data.local.api_token;
  bool get isLoggedIn => this.cache != null;
  // int get id => this._user.id;

  //Temporary details from Registration
  CustomerRegistrationResponse customerReg;
  SalonRegistrationResponse salonReg;
  bool isCustomerReg = true;

  UserInfoCache() {
    try {
      //On initiate, attempt to populate fields from Local Storage
      getUserDataFromStorage();
    } catch (e) {
      print(
          'Could not find any data in shared Preference Location: \'user_data\'');
    }
  }

  ///Use only one param at a time
  updateRegistrationInfo({CustomerRegistrationResponse customerReg, SalonRegistrationResponse salonReg}){
    this.customerReg = customerReg;
    this.salonReg = salonReg;
    if (salonReg != null) {
      //is salon
      isCustomerReg = false;
    }  else {
      isCustomerReg = true;
    }

  }

  getUserDataFromStorage() async {
    // try {
      //Instance of SharedPreferences
      SharedPreferences storage = await SharedPreferences.getInstance();
      String data = await storage.getString('user_data');

      //Set object fields
      Cache res = Cache.fromJson(data);

      if (res.isCustomer) {
        print('${res.customer.data.email}\'s data fetched from Storage successfully');
      }  else {
        print('${res.salon.data.local.email}\'s data fetched from Storage successfully');
      }

    // }

    // catch (e) {
    //   print('There is no data in location: \'user_data\'');
    // }
  }

  ///Please use only one response at a time
  Future<bool> cacheLoginResponse({CustomerLoginResponse customer, SalonLoginResponse salon}) async {

    try {
      //Instance of SharedPreferences
      SharedPreferences storage = await SharedPreferences.getInstance();
      //Sets value in storage labelled ['user_data']

      Cache data;
      if (salon != null) {
        //is salon
        data = Cache(salon: salon);
      }  else {
        data = Cache(customer: customer);
      }

      // print(data.toMap());
      bool val = await storage.setString('user_data', data.toJson());

      //set new values in class field
      this.cache = data;

      if (data.isCustomer) {
        print('${data.customer.data.email}\'s data cached successfully');
      }  else {
        print('${data.salon.data.local.email}\'s data cached successfully');
      }

      return val;
    } catch (e) {
      print(
          'An error occured while trying to cache Login Response of details: $salon or $customer');
      return false;
    }
  }

  // Future<bool> updateUserData(User userdata) async {
  //   try {
  //     //Instance of SharedPreferences
  //     SharedPreferences storage = await SharedPreferences.getInstance();
  //     LoginResponse newUserData =
  //         LoginResponse(token: this.token, user: userdata);
  //
  //     //Update field in UserInfoCache
  //     this._loginResponse = newUserData;
  //     this._user = newUserData.user;
  //     this._profile = userdata.profile;
  //
  //     //Sets new data in storage labelled ['user_data']
  //     bool val = await storage.setString('user_data', jsonEncode(newUserData));
  //
  //     print('data in storage & app updated with ${this.user.name}\'s details');
  //     return val;
  //   } catch (e) {
  //     print('UserInfoCache: Failed to update User Data');
  //     return false;
  //   }
  // }

  clearCache() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.remove('user_data');

    this.cache = null;
  }

}
