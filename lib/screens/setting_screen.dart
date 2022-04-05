import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshgarden/controller/product_controller.dart';
import 'package:freshgarden/screens/general_screen.dart';
import 'package:freshgarden/screens/sales_screen.dart';
import 'package:freshgarden/widgets/drawer_widget.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
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
        backgroundColor: Colors.white,
        drawer: const DrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Setting',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(GeneralScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                      width: 0.2,
                      color: Color(0xFF4D6D80),
                    )),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.31),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 18.27,
                        ),
                        SvgPicture.asset('assets/setting_general.svg'),
                        const SizedBox(
                          width: 18.27,
                        ),
                        const Text(
                          'General',
                          style: TextStyle(
                            color: Color(0xFF4D6D80),
                            fontFamily: 'RobotoMedium',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(SalesScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 0.2,
                        color: Color(
                          0xFF4D6D80,
                        ),
                      ),
                      bottom: BorderSide(
                        width: 0.2,
                        color: Color(
                          0xFF4D6D80,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.31),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 18.27,
                        ),
                        SvgPicture.asset('assets/setting_saletax.svg'),
                        const SizedBox(
                          width: 18.27,
                        ),
                        const Text(
                          'Sales Tax',
                          style: TextStyle(
                            color: Color(0xFF4D6D80),
                            fontFamily: 'RobotoMedium',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
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
      ),
    );
  }
}
