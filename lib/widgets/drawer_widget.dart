import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshgarden/controller/product_controller.dart';
import 'package:freshgarden/screens/checkout_screen.dart';
import 'package:freshgarden/screens/customer_screen.dart';
import 'package:freshgarden/screens/home_screen.dart';
import 'package:freshgarden/screens/payment_sceen.dart';
import 'package:freshgarden/screens/setting_screen.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key, String? drawerSeleted}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  // String drawerSeleted = 'Checkout';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF152935),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 130.0,
              padding: EdgeInsets.only(top: 17.0),
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'The Fresh Garden',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 9.0,
                    ),
                    Text(
                      'Phạm Xuân Định',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder<ProductController>(
              init: ProductController(),
              builder: (controller) => Column(
                children: [
                  Container(
                    color: controller.drawerSeleted == 'Checkout'
                        ? Color(0xFF4D6D81)
                        : Colors.transparent,
                    child: ListTile(
                      horizontalTitleGap: 0.0,
                      leading: SvgPicture.asset(
                        'assets/drawer_checkout.svg',
                        color: controller.drawerSeleted == 'Checkout'
                            ? Colors.white
                            : Color(0xFF4D6D80),
                      ),
                      title: const Text(
                        'Checkout',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          Get.to(CheckoutScreen());
                          controller.drawerSeleted = 'Checkout';
                        });
                        // Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    color: controller.drawerSeleted == 'Products'
                        ? Color(0xFF4D6D81)
                        : Colors.transparent,
                    child: ListTile(
                      horizontalTitleGap: 0.0,
                      leading: SvgPicture.asset(
                        'assets/drawer_product.svg',
                        color: controller.drawerSeleted == 'Products'
                            ? Colors.white
                            : Color(0xFF4D6D80),
                      ),
                      title: const Text(
                        'Products',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          Get.to(HomeScreen());
                          controller.drawerSeleted = 'Products';
                        });
                        // Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    color: controller.drawerSeleted == 'Customer'
                        ? Color(0xFF4D6D81)
                        : Colors.transparent,
                    child: ListTile(
                      horizontalTitleGap: 0.0,
                      leading: SvgPicture.asset(
                        'assets/drawer_customer.svg',
                        color: controller.drawerSeleted == 'Customer'
                            ? Colors.white
                            : Color(0xFF4D6D80),
                      ),
                      title: const Text(
                        'Customer',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Get.to(CustomerScreen());
                        setState(() {
                          controller.drawerSeleted = 'Customer';
                        });
                        // Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    color: controller.drawerSeleted == 'Settings'
                        ? Color(0xFF4D6D81)
                        : Colors.transparent,
                    child: ListTile(
                      horizontalTitleGap: 0.0,
                      leading: SvgPicture.asset(
                        'assets/drawer_setting.svg',
                        color: controller.drawerSeleted == 'Settings'
                            ? Colors.white
                            : Color(0xFF4D6D80),
                      ),
                      title: const Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Get.to(SettingScreen());
                        setState(() {
                          controller.drawerSeleted = 'Settings';
                        });
                        // Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    color: controller.drawerSeleted == 'Cart'
                        ? Color(0xFF4D6D81)
                        : Colors.transparent,
                    child: ListTile(
                      horizontalTitleGap: 0.0,
                      leading: SvgPicture.asset(
                        'assets/drawer_cart.svg',
                        color: controller.drawerSeleted == 'Cart'
                            ? Colors.white
                            : Color(0xFF4D6D80),
                      ),
                      title: const Text(
                        'Cart',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Get.to(PaymentScreen());
                        setState(() {
                          controller.drawerSeleted = 'Cart';
                        });
                        // Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    color: controller.drawerSeleted == 'Users'
                        ? Color(0xFF4D6D81)
                        : Colors.transparent,
                    child: ListTile(
                      horizontalTitleGap: 0.0,
                      leading: SvgPicture.asset(
                        'assets/drawer_user.svg',
                        color: controller.drawerSeleted == 'Users'
                            ? Colors.white
                            : Color(0xFF4D6D80),
                      ),
                      title: const Text(
                        'Users',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          controller.drawerSeleted = 'Users';
                        });
                        // Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
