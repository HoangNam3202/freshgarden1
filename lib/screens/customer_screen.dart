import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshgarden/controller/customer_controller.dart';
import 'package:freshgarden/controller/product_controller.dart';
import 'package:freshgarden/models/customer_model.dart';
import 'package:freshgarden/screens/general_screen.dart';
import 'package:freshgarden/screens/new_customer_screen.dart';
import 'package:freshgarden/screens/sales_screen.dart';
import 'package:freshgarden/widgets/drawer_widget.dart';
import 'package:get/get.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    Get.put(ProductController()).drawerSeleted = 'Settings';
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF6F6F6),
        drawer: const DrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Customer',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          leading: IconButton(
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            icon: SvgPicture.asset(
              'assets/home_menu.svg',
              color: Colors.black,
              semanticsLabel: 'Open menu',
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.search),
                      GestureDetector(
                        onTap: () {
                          Get.to(NewCustomerScreen());
                        },
                        child: const Icon(Icons.add_circle_outline_outlined),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 130.0,
                color: Color(0xFFF6F6F6),
                child: GetBuilder<CustomerController>(
                  init: CustomerController(),
                  builder: (controller) {
                    return ListView.builder(
                        itemCount: controller.customers.length,
                        itemBuilder: (context, index) {
                          CustomerModel item = controller.customers[index];
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 3.0),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      width: 54.0,
                                      height: 54.0,
                                      color: const Color(0xFFFFFFFF)
                                          .withOpacity(0.3),
                                      // ignore: unrelated_type_equality_checks
                                      child: Image.asset(
                                        'images/customer_avatar.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 11.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 250.0,
                                        margin: EdgeInsets.only(bottom: 3.0),
                                        child: Text(
                                          '${item.name}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontFamily: 'RobotoMedium',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.0,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Text(
                                        '${item.mobile}',
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Container(
                                        width: 250.0,
                                        child: Text(
                                          '${item.address}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: EdgeInsets.only(bottom: 3.0),
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.all(9.0),
//                   child: Row(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10.0),
//                         child: Container(
//                           width: 54.0,
//                           height: 54.0,
//                           color: const Color(0xFFFFFFFF).withOpacity(0.3),
//                           // ignore: unrelated_type_equality_checks
//                           child: Image.asset(
//                             'images/customer_avatar.png',
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 11.0,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 250.0,
//                             child: const Text(
//                               'Customer',
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                   fontFamily: 'RobotoMedium',
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 14.0,
//                                   color: Colors.black),
//                             ),
//                           ),
//                           Text('Dicription'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),