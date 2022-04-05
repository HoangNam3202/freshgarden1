import 'package:flutter/material.dart';
import 'package:freshgarden/controller/product_controller.dart';
import 'package:freshgarden/screens/newproduct_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TabItems extends StatefulWidget {
  const TabItems({Key? key}) : super(key: key);

  @override
  State<TabItems> createState() => _TabItemsState();
}

class _TabItemsState extends State<TabItems> {
  final currencyFormatter = NumberFormat.currency(locale: 'en_US', name: 'EUR');
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                GestureDetector(
                  onTap: () {
                    Get.to(const NewProductScreen());
                  },
                  child: const Icon(Icons.add_circle_outline_outlined),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 190.0,
            margin: const EdgeInsets.only(top: 10.0),
            child: GetBuilder<ProductController>(
              init: ProductController(),
              builder: (controller) => Obx(() {
                // ignore: prefer_is_empty
                if (controller.products.length > 0) {
                  return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        final format = NumberFormat("#.000", "en_US");
                        String money = format
                            .format(int.parse(controller.products[index].price))
                            .toString();
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 19.23),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                // ignore: sized_box_for_whitespace
                                child: Container(
                                  width: 124.0,
                                  height: 95.0,
                                  child: Image.asset(
                                    'images/product.png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 11.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          178.0,
                                      margin:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        '${controller.products[index].name}',
                                        maxLines: 2,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'HelveticaBold',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.0),
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
                            ],
                          ),
                        );
                      });
                } else {
                  return const Text('Dont have product');
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
