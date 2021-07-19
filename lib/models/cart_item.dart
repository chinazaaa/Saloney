import 'package:starter_project/models/service/salon_service.dart';

import 'service/get_published_service_reponse.dart';

class CartItem {
  SalonService product;
  int _quantity = 1;

  int get quantity => _quantity;

  CartItem(this.product);

  incrementQuantity() {
    _quantity = _quantity + 1;
  }

  decrementQuantity() {
    if (_quantity > 1) {
      _quantity = _quantity - 1;
    } else {
      print('quantity cannot be less than 1');
    }
  }
}
