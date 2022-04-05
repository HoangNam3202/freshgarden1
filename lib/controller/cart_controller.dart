import 'dart:io';

import 'package:freshgarden/models/cart_model.dart';
import 'package:freshgarden/models/product_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CartController extends GetxController {
  RxList<Cart> carts = RxList<Cart>([
    Cart(
      idProduct: 'N9TT-9G0A-B7FQ-RANC',
      name: 'In Bloom PJs for Girls & 18-inch Dolls',
      price: '29',
      imageUrl: 'images/product.png',
      quality: 1,
      color: '0xFF1CC3AC',
    ),
  ]);

  void onAddCart(Cart cart) {
    carts.add(cart);
  }

  void onHandleQuality(Product product, String type) {
    Cart cart = Cart(
      idProduct: product.idProduct,
      name: product.name,
      price: product.price,
      imageUrl: product.imageUrl,
      quality: product.quality + 1,
      color: product.color,
    );

    int index =
        carts.indexWhere((element) => element.idProduct == product.idProduct);
    if (type == 'increase') {
      if (index >= 0) {
        carts[index].quality += 1;
      } else {
        carts.add(cart);
      }
    } else {
      if (index >= 0) {
        if (carts[index].quality >= 0) {
          carts[index].quality -= 1;
          if (carts[index].quality == 0) {
            carts.removeAt(index);
          }
        }
      }
    }
    update();
  }
}
