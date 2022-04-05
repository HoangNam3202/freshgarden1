import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshgarden/controller/product_controller.dart';
import 'package:freshgarden/models/product_model.dart';
import 'package:freshgarden/widgets/newproduct_bottomsheet_color.dart';
import 'package:freshgarden/widgets/newproduct_bottomsheet_image.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TabNewProduct extends StatefulWidget {
  const TabNewProduct({Key? key}) : super(key: key);

  @override
  State<TabNewProduct> createState() => _TabNewProductState();
}

class _TabNewProductState extends State<TabNewProduct> {
  final nameInput = TextEditingController();
  final priceInput = TextEditingController();
  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;
  FocusNode nameFocusNode = new FocusNode();
  FocusNode priceFocusNode = new FocusNode();
  bool focusCheck = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameFocusNode.addListener(() {
      setState(() {
        focusCheck = nameFocusNode.hasFocus;
      });
    });
    priceFocusNode.addListener(() {
      setState(() {
        focusCheck = priceFocusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return false;
      },
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.45,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  !focusCheck
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: 40.0,
                            right: 40.0,
                            top: 32.0,
                          ),
                          child: GetBuilder<ProductController>(
                            init: ProductController(),
                            builder: (controller) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const BottomSheetWidget();
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 49.0,
                                        height: 50.0,
                                        color: const Color(0xFFC4C4C4),
                                        child: SvgPicture.asset(
                                          'assets/newproduct_image.svg',
                                          width: 24.0,
                                          height: 24.0,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 124.0,
                                          height: 124.0,
                                          color: const Color(0xFF1CC3AC),
                                          // ignore: unrelated_type_equality_checks
                                          child:
                                              controller.imagePicker.path != ''
                                                  ? Image.file(
                                                      controller.imagePicker,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.asset(
                                                      'images/product.png',
                                                      fit: BoxFit.cover),
                                        ),
                                        Positioned(
                                          bottom: 0.0,
                                          child: Container(
                                            color: Color(int.parse(
                                                    controller.colorSelected))
                                                .withOpacity(0.8),
                                            width: 124.0,
                                            height: 124.0 / 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 6.0,
                                                right: 6.0,
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 18.0,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 4.0),
                                                    child: const Text(
                                                      'In Bloom PJs',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'HelveticaBold',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14.0,
                                                        color: Colors.white,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  const Text(
                                                    'đ 29.000',
                                                    style: TextStyle(
                                                      fontFamily: 'Helvetica',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const BottomSheetColorWidget();
                                        },
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(
                                        width: 49.0,
                                        height: 50.0,
                                        color: Color(int.parse(
                                            controller.colorSelected)),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      : SizedBox(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: focusCheck ? 5.0 : 48.0,
                      bottom: focusCheck ? 30.0 : 48.0,
                    ),
                    child: Container(
                      color: Color(0xFFDFE1E3),
                      height: 50.0,
                      child: TextField(
                        focusNode: nameFocusNode,
                        controller: nameInput,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Product Name',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Container(
                      color: priceFocusNode.hasFocus
                          ? Color.fromRGBO(21, 41, 53, 0.1)
                          : Color(0xFFDFE1E3),
                      height: 50.0,
                      child: TextField(
                        focusNode: priceFocusNode,
                        keyboardType: TextInputType.number,
                        controller: priceInput,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Price',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 15.0),
                child: GestureDetector(
                  onTap: () {
                    Get.put(ProductController()).onAddProduct(Product(
                      name: nameInput.text,
                      price: priceInput.text,
                      quality: 0,
                      color: Get.put(ProductController()).colorSelected,
                    ));

                    final snackBar = SnackBar(
                      content: Text(
                          '"${nameInput.text}" has been added to your list'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    nameInput.text = '';
                    priceInput.text = '';
                    Get.put(ProductController()).imagePicker = File('');
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1CC3AC),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        'Create product'.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _onBackPressed(BuildContext context) async {
    FocusScope.of(context).unfocus();
  }
}
