import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshgarden/controller/cart_controller.dart';
import 'package:freshgarden/models/cart_model.dart';
import 'package:freshgarden/models/product_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.navigate_before,
                color: Colors.black,
              )),
          title: const Text(
            'Payment',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 183.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 7.0),
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              color: Color(0xFF1CC3AC),
              margin: EdgeInsets.only(top: 7.0),
              child: Center(
                  child: Text(result?.code != null
                      ? '${result?.code}'
                      : 'QR Scanning...')),
            ),
            Container(
              width: double.infinity,
              height: 80.0,
              color: Color(0xFFF6F6F6),
              child: Row(
                children: [
                  Container(
                    width: 120.0,
                    decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(
                        width: 0.5,
                        color: Color(0xFF4D6D80),
                      )),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.picture_in_picture_outlined,
                          color: Color(0xFF4D6D80),
                        ),
                        SizedBox(
                          height: 15.84,
                        ),
                        Text(
                          '0 Kg',
                          style: TextStyle(
                              color: Color(0xFF4D6D80),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'RobotoBold'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 120.0,
                    decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(
                        width: 0.5,
                        color: Color(0xFF4D6D80),
                      )),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.attach_money,
                          color: Color(0xFF4D6D80),
                        ),
                        SizedBox(
                          height: 15.84,
                        ),
                        Text(
                          'đ 00.00',
                          style: TextStyle(
                              color: Color(0xFF4D6D80),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'RobotoBold'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 120.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/payment_tag.svg'),
                        const SizedBox(
                          height: 15.84,
                        ),
                        const Text(
                          '00.00',
                          style: TextStyle(
                              color: Color(0xFF4D6D80),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'RobotoBold'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              constraints: const BoxConstraints(
                minHeight: 50.0,
                maxHeight: 110.0,
              ),
              child: GetBuilder<CartController>(
                init: CartController(),
                builder: (controller) => ListView.builder(
                    reverse: true,
                    itemCount: controller.carts.length,
                    itemBuilder: (context, index) {
                      int totalPriceItem =
                          int.parse(controller.carts[index].price) *
                              controller.carts[index].quality;
                      final format = NumberFormat("#.000", "en_US");
                      String moneyTotal =
                          format.format(totalPriceItem).toString();
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              width: 5.0,
                              height: 50.0,
                              color: Color(
                                int.parse(controller.carts[index].color),
                              ),
                              margin: EdgeInsets.only(right: 15.0),
                            ),
                            Text(
                              '${controller.carts[index].quality} Kg',
                              style: const TextStyle(
                                color: Color(0xFF152935),
                                fontFamily: 'RobotoMedium',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 24.0,
                            ),
                            Container(
                              width: 160.0,
                              child: Text(
                                '${controller.carts[index].name}',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color(0xFF152935),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0),
                              ),
                            ),
                            const SizedBox(
                              width: 17.0,
                            ),
                            Text(
                              'đ ${moneyTotal}',
                              style: const TextStyle(
                                  color: Color(0xFF152935),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0),
                            ),
                            const SizedBox(
                              width: 20.5,
                            ),
                            const Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                              // size: 20.0,
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
            GetBuilder<CartController>(
                init: CartController(),
                builder: (controller) {
                  final total = controller.carts.fold(0, (int sum, element) {
                    return sum + int.parse(element.price) * element.quality;
                  });
                  return Container(
                    width: double.infinity,
                    height: 120.0,
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 3.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'TỔNG CỘNG đ ${total}.000',
                          style: const TextStyle(
                            fontFamily: 'RobotoBold',
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                            color: Color(0xFF152935),
                          ),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/payment_tag.svg',
                              color: Color(0xFFFF0000),
                            ),
                            const SizedBox(
                              width: 8.17,
                            ),
                            const Text(
                              '- đ  0.000',
                              style: TextStyle(
                                fontFamily: 'RobotoBold',
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                                color: Color(0xFFFF0000),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        const Text(
                          'Lorem ipsum dolor sit amet',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF1CC3AC),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    bool scanCheck = true;
    if (scanCheck) {
      controller.scannedDataStream.listen((scanData) {
        setState(() {
          result = scanData;
          // _launchURL(scanData.toString());
          controller.pauseCamera();
          Get.put(CartController()).onHandleQuality(
              Product(
                  idProduct: 'ogGM_pzr3ybW',
                  name: 'product qr',
                  price: '10',
                  imageUrl: '',
                  quality: 0,
                  color: '0xFFF15F79'),
              'increase');
          final snackBar = SnackBar(
            content: Text('"product qr" has been added to your list'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Timer(Duration(seconds: 5), () => controller.resumeCamera());
        });
      });
    }
  }

  void _launchURL(String code) async {
    if (!await launch('${code}')) ;
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
