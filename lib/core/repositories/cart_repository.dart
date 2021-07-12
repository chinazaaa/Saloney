import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/core/api/bookings_api/bookings_api.dart';
import 'package:starter_project/models/api_response.dart';
import 'package:starter_project/models/api_response_variants/bookings_response.dart';
import 'package:starter_project/models/cart_item.dart';
import 'package:starter_project/models/service/get_published_service_reponse.dart';
import 'package:starter_project/models/service/salon_service.dart';
import 'package:starter_project/ui_helpers/responsive_state/base_view_model.dart';
import 'package:starter_project/ui_helpers/responsive_state/view_state.dart';

import '../../locator.dart';

class CartRepository extends BaseNotifier {
  BookingResponse bookingResponse;
  //api
  final bookingApi = locator<BookingsApi>();

  //vendor details
  String vendorId;
  String vendorName;
  String vendorLocation;
  String tags;

  //cart details
  List<CartItem> cart = [];
  double _actualDeliveryCost = 0;

  double currentPrice = 0;
  double get deliveryCost => currentPrice == 0 ? 0 : _actualDeliveryCost;
  double get total => currentPrice + deliveryCost;

  void addToCart(SalonService p) {
    cart.add(CartItem(p));
    calculateCost();
    Get.snackbar(
      'Added to Cart',
      'Item has been added to cart',
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      snackStyle: SnackStyle.FLOATING,
      duration: Duration(seconds: 1),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black26,
    );
    notifyListeners();
  }

  void removeItemFromCart({int index, CartItem item}) {
    if (item != null) {
      cart.remove(item);
    } else {
      cart.removeAt(index);
    }
    calculateCost();
    notifyListeners();
  }

  calculateCost() {
    double a = 0;
    if (cart.isNotEmpty) {
      for (int i = 0; i < cart.length; i++) {
        CartItem p = cart[i];
        int total = int.tryParse(p.product.price) * p.quantity;
        a += total;
      }
    }
    currentPrice = a;
  }

  incrementQuantity({int index, CartItem item}) {
    if (item != null) {
      cart[cart.indexOf(item)].incrementQuantity();
    } else {
      cart[index].incrementQuantity();
    }
    calculateCost();
    notifyListeners();
  }

  decrementQuantity({int index, CartItem item}) {
    if (item != null) {
      cart[cart.indexOf(item)].decrementQuantity();
    } else {
      cart[index].decrementQuantity();
    }
    calculateCost();
    notifyListeners();
  }

  clearCart() {
    cart = [];
    currentPrice = 0;
    vendorId = null;
    vendorName = null;
    vendorLocation = null;
    notifyListeners();
  }

  updateDeliveryCost(double cost) {
    _actualDeliveryCost = cost;
    notifyListeners();
  }

  updateVendorDetails(
      String vendorId, String vendorName, String vendorLocation, String tags) {
    this.vendorId = vendorId;
    this.vendorName = vendorName;
    this.vendorLocation = vendorLocation;
    this.tags = tags;
    notifyListeners();
  }

  //Api call to checkout cart
  Future<bool> checkoutCart(String bookingDate) async {
    if (cart.isEmpty || vendorId == null) {
      //show snackbar
      return false;
    }

    setState(ViewState.Busy);
    print(cart.map((e) => e.product.id).toList());
    print(bookingDate);
    try {
      bookingResponse = await bookingApi.createBooking(
          serviceIds: cart.map((e) => e.product.id).toList(),
          salonId: vendorId,
          bookingDate: bookingDate);

      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      Get.snackbar(
        'No Internet!',
        'Please check your internet Connection',
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black26,
      );
    }
    // catch (e) {
    //   Get.snackbar(
    //     'An Error occured!',
    //     'Please try again in a bit. \nDetails: $e',
    //     margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
    //     snackStyle: SnackStyle.FLOATING,
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.black26,
    //   );
    // }
    setState(ViewState.Idle);
    return false;
  }
}
