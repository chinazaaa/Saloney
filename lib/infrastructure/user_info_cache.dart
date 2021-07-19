import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/models/api_response_variants/customer_login_response.dart';
import 'package:starter_project/models/api_response_variants/customer_registration_response.dart';
import 'package:starter_project/models/api_response_variants/salon_login_response.dart';
import 'package:starter_project/models/api_response_variants/salon_registration_response.dart';
import 'package:starter_project/models/cache.dart';
import 'package:starter_project/models/customer.dart';
import 'package:starter_project/models/salon.dart';
import 'package:starter_project/models/user.dart';

///This class is used to sync User Data
class UserInfoCache {
  //Objects used to set data
  Cache cache;
  //getters
  CustomerLoginResponse get customer => cache.customer;
  SalonLoginResponse get salon => cache.salon;

  //StorageUtil _storageUtil = Get.find();

  //--token
  String get token => this.cache.isCustomer
      ? this.cache.customer.data.apiToken
      : this.cache.salon.data.user.local.apiToken;

  String get id => this.cache.isCustomer
      ? this.cache.customer.data.id
      : this.cache.salon.data.user.id;

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
  updateRegistrationInfo(
      {CustomerRegistrationResponse customerReg,
      SalonRegistrationResponse salonReg}) {
    this.customerReg = customerReg;
    this.salonReg = salonReg;
    if (salonReg != null) {
      //is salon
      isCustomerReg = false;
    } else {
      isCustomerReg = true;
    }
  }

  getUserDataFromStorage() async {
    try {
      //Instance of SharedPreferences
      SharedPreferences storage = await SharedPreferences.getInstance();
      String data = storage.getString('user_data');

      //Set object fields
      Cache res = Cache.fromJson(data);
      cache = res;

      if (res.isCustomer) {
        print(
            '${res.customer.data.email}\'s data fetched from Storage successfully');
      } else {
        print(
            '${res.salon.data.user.local.email}\'s data fetched from Storage successfully');
      }
    } catch (e) {
      print('There is no data in location: \'user_data\'');
    }
  }

  ///Please use only one response at a time
  Future<bool> cacheLoginResponse(
      {CustomerLoginResponse customer, SalonLoginResponse salon}) async {
    try {
      //Instance of SharedPreferences
      SharedPreferences storage = await SharedPreferences.getInstance();
      //Sets value in storage labelled ['user_data']

      Cache data;
      if (salon != null) {
        //is salon
        data = Cache(salon: salon);
      } else {
        data = Cache(customer: customer);
      }

      bool val = await storage.setString('user_data', data.toJson());

      //set new values in class field
      this.cache = data;

      if (data.isCustomer) {
        print('${data.customer.data.email}\'s data cached successfully');
        // await _storageUtil.saveToken(ACCESS_TOKEN, data.customer.data.apiToken);
      } else {
        print('${data.salon.data.user.local.email}\'s data cached successfully');
        // await _storageUtil.saveToken(ACCESS_TOKEN, data.salon.data.local.api_token);
      }
      return val;
    } catch (e) {
      print(
          'An error occured while trying to cache Login Response of details: $salon or $customer');
      return false;
    }
  }

  Future<bool> updateSalonOwnerProfile(User userdata) async {
    try {
      //create new salon login response from new user data for caching
      SalonLoginResponse newCache = SalonLoginResponse(
          message: 'updated',
          success: true,
          data: SalonData(
            user: userdata,
            salon: this.salon.data.salon
          ));
      //Sets new data in storage labelled ['user_data']
      cacheLoginResponse(salon: newCache);
      print('data in storage & app updated with ${userdata.local.userName}\'s details');
      return true;
    } catch (e) {
      print('UserInfoCache: Failed to update User Data');
      return false;
    }
  }

  Future<bool> updateSalonInfo(Salon salon) async {
    try {
      //create new salon login response from new salon data for caching
      SalonLoginResponse newCache = SalonLoginResponse(
          message: 'updated',
          success: true,
          data: SalonData(
              user: this.salon.data.user,
              salon: salon
          ));
      //Sets new data in storage labelled ['user_data']
      cacheLoginResponse(salon: newCache);
      print('data in storage & app updated with ${salon.nameOfSalon}\'s details');
      return true;
    } catch (e) {
      print('UserInfoCache: Failed to update User Data');
      return false;
    }
  }

  Future<bool> updateCustomer(Customer customer) async {
    try {
      //create new salon login response from new salon data for caching
      CustomerLoginResponse newCache = CustomerLoginResponse(
          message: 'updated',
          success: true,
          data: customer);
      //Sets new data in storage labelled ['user_data']
      cacheLoginResponse(customer: newCache);
      print('data in storage & app updated with ${customer.userName}\'s details');
      return true;
    } catch (e) {
      print('UserInfoCache: Failed to update User Data');
      return false;
    }
  }

  clearCache() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.remove('user_data');

    this.cache = null;
  }
}
