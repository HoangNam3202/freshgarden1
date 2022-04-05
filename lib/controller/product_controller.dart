import 'dart:io';

import 'package:freshgarden/models/product_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  RxList<Product> products = RxList<Product>([
    Product(
      idProduct: 'N9TT-9G0A-B7FQ-RANC',
      name: 'In Bloom PJs for Girls & 18-inch Dolls',
      price: '29',
      imageUrl: 'images/product.png',
      quality: 1,
      color: '0xFF1CC3AC',
    ),
    Product(
      idProduct: 'NHLE-L6MI-4GE4-ETEV',
      name: 'In Bloom PJs for Girls & 20-inch Dolls',
      price: '39',
      imageUrl: 'images/product.png',
      quality: 0,
      color: '0xFFF15F79',
    ),
    Product(
      idProduct: 'XNSS-HSJW-3NGU-8XTJ',
      name: 'In Bloom PJs for Girls & 30-inch Dolls',
      price: '49',
      imageUrl: 'images/product.png',
      quality: 0,
      color: '0xFFF2994A',
    ),
    Product(
      idProduct: 'SXFP-CHYK-ONI6-S89U',
      name: 'In Bloom PJs for Girls & 40-inch Dolls',
      price: '59',
      imageUrl: 'images/product.png',
      quality: 0,
      color: '0xFFF2C94C',
    ),
    Product(
      idProduct: 'QK6A-JI6S-7ETR-0A6C',
      name: 'In Bloom PJs for Girls & 50-inch Dolls',
      price: '69',
      imageUrl: 'images/product.png',
      quality: 0,
      color: '0xFF1CC3AC',
    ),
  ]);

  String colorSelected = '0xFF1CC3AC';

  void onChangeColor(String color) {
    colorSelected = color;
    update();
  }

  void onAddProduct(Product product) {
    products.add(product);
    update();
  }

  void onHandleQuality(Product product, String type) {
    int index = products.indexOf(product);
    if (type == 'increase') {
      products[index].quality += 1;
    } else {
      if (products[index].quality > 0) {
        products[index].quality -= 1;
      }
    }
    update();
  }

  File imagePicker = File('');
  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePicker = File(pickedFile.path);
      // print('imagesPicker : ${base64Encode(imagePicker.readAsBytesSync())}');
    } else {
      // ignore: avoid_print
      print('No image selected.');
    }
    update();
  }

  Future shootImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imagePicker = File(pickedFile.path);
    } else {
      // ignore: avoid_print
      print('No image selected.');
    }
    update();
  }

  String drawerSeleted = 'Products';
}
