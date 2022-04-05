import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshgarden/controller/cart_controller.dart';
import 'package:freshgarden/controller/product_controller.dart';
import 'package:freshgarden/screens/payment_sceen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckoutTabItems extends StatefulWidget {
  const CheckoutTabItems({Key? key}) : super(key: key);

  @override
  State<CheckoutTabItems> createState() => _TabItemsState();
}

class _TabItemsState extends State<CheckoutTabItems> {
  final currencyFormatter = NumberFormat.currency(locale: 'en_US', name: 'EUR');
  bool listLayout = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.search),
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: 160.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(const PaymentScreen());
                            },
                            child: SvgPicture.asset('assets/tab_scan.svg'),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.to(const NewProductScreen());
                            },
                            child: SvgPicture.asset('assets/tab_flash.svg'),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.to(const NewProductScreen());
                              setState(() {
                                listLayout = !listLayout;
                              });
                            },
                            child: listLayout
                                ? const Icon(Icons.list_rounded)
                                : SvgPicture.asset('assets/tab_collection.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 250.0,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10.0),
                child: GetBuilder<ProductController>(
                  init: ProductController(),
                  builder: (controller) => Obx(() {
                    // ignore: prefer_is_empty
                    // list map
                    if (controller.products.length > 0) {
                      if (listLayout) {
                        return GetBuilder<ProductController>(
                          builder: (controller) => Obx(() {
                            return GridView.count(
                              crossAxisCount: 2,
                              children: controller.products.map((item) {
                                final format = NumberFormat("#.000", "en_US");
                                String money = format
                                    .format(int.parse(item.price))
                                    .toString();
                                return Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Container(
                                          width: 124.0,
                                          height: 124.0,
                                          // color: const Color(0xFF1CC3AC),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF1CC3AC),
                                            border: Border.all(
                                              width: item.quality == 0 ? 0 : 3,
                                              color: const Color(0xFF1CC3AC),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                // ignore: unrelated_type_equality_checks
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.asset(
                                                    'images/product.png',
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0.0,
                                                left:
                                                    item.quality == 0 ? 0 : -2,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10.0),
                                                    bottomRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                  child: Container(
                                                    color: Color(int.parse(
                                                            item.color))
                                                        .withOpacity(0.8),
                                                    width: 124.0,
                                                    height: 124.0 / 2,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 6.0,
                                                        right: 6.0,
                                                        top: 8.0,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            height: 18.0,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom:
                                                                        4.0),
                                                            child: Text(
                                                              '${item.name}',
                                                              style:
                                                                  const TextStyle(
                                                                fontFamily:
                                                                    'HelveticaBold',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 14.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                          Text(
                                                            'đ ${money}',
                                                            style:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'Helvetica',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 12.0,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 30.0,
                                        height: 124.0,
                                        margin:
                                            const EdgeInsets.only(left: 3.0),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF2F2F2),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.put(CartController())
                                                    .onHandleQuality(
                                                  item,
                                                  'increase',
                                                );
                                                controller.onHandleQuality(
                                                    item, 'increase');
                                              },
                                              child: Icon(
                                                Icons.arrow_drop_up,
                                                color: item.quality == 0
                                                    ? const Color(0xFFDBDBDB)
                                                    : const Color(0xFF1CC3AC),
                                              ),
                                            ),
                                            Text(
                                              '${item.quality}',
                                              style: TextStyle(
                                                color: item.quality == 0
                                                    ? const Color(0xFFDBDBDB)
                                                    : const Color(0xFF1CC3AC),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.put(CartController())
                                                    .onHandleQuality(
                                                  item,
                                                  'decrease',
                                                );
                                                controller.onHandleQuality(
                                                    item, 'decrease');
                                              },
                                              child: Icon(
                                                Icons.arrow_drop_down,
                                                color: item.quality == 0
                                                    ? Color(0xFFDBDBDB)
                                                    : Color(0xFF1CC3AC),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                          }),
                        );
                      }
                      // collection map
                      else {
                        return ListView.builder(
                            itemCount: controller.products.length,
                            itemBuilder: (context, index) {
                              final format = NumberFormat("#.000", "en_US");
                              String money = format
                                  .format(int.parse(
                                      controller.products[index].price))
                                  .toString();
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 19.23),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 124.0,
                                      height: 95.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 3,
                                            color: controller.products[index]
                                                        .quality ==
                                                    0
                                                ? Colors.transparent
                                                : Color(0xFF1CC3AC),
                                          )),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        child: Image.asset(
                                          'images/product.png',
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 11.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                208.0,
                                            margin: const EdgeInsets.only(
                                              bottom: 10.0,
                                              // right: 9.0,
                                            ),
                                            child: Text(
                                              '${controller.products[index].name}',
                                              maxLines: 3,
                                              style: const TextStyle(
                                                fontFamily: 'HelveticaBold',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16.0,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'đ ${money}',
                                            style: const TextStyle(
                                                fontFamily: 'Helvetica',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 18.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 30.0,
                                      height: 95.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2F2F2),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.put(CartController())
                                                  .onHandleQuality(
                                                controller.products[index],
                                                'increase',
                                              );
                                              controller.onHandleQuality(
                                                  controller.products[index],
                                                  'increase');
                                            },
                                            child: Icon(
                                              Icons.arrow_drop_up,
                                              color: controller.products[index]
                                                          .quality ==
                                                      0
                                                  ? Color(0xFFDBDBDB)
                                                  : Color(0xFF1CC3AC),
                                            ),
                                          ),
                                          Text(
                                            '${controller.products[index].quality}',
                                            style: TextStyle(
                                              color: controller.products[index]
                                                          .quality ==
                                                      0
                                                  ? Color(0xFFDBDBDB)
                                                  : Color(0xFF1CC3AC),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.put(CartController())
                                                  .onHandleQuality(
                                                controller.products[index],
                                                'decrease',
                                              );
                                              controller.onHandleQuality(
                                                  controller.products[index],
                                                  'decrease');
                                            },
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              color: controller.products[index]
                                                          .quality ==
                                                      0
                                                  ? Color(0xFFDBDBDB)
                                                  : Color(0xFF1CC3AC),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                    } else {
                      return const Text('Dont have product');
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
        GetBuilder<CartController>(
            init: CartController(),
            builder: (controller) {
              final total = controller.carts.fold(0, (int sum, element) {
                return sum + int.parse(element.price) * element.quality;
              });
              final cartCount = controller.carts.fold(0, (int sum, element) {
                if (element.quality > 0) {
                  sum++;
                } else {
                  sum;
                }
                return sum;
              });
              return Positioned(
                bottom: 0.0,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(PaymentScreen());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1CC3AC),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Center(
                          child: Text(
                            '${cartCount} items = ${total}.000đ',
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
              );
            }),
      ],
    );
  }
}
