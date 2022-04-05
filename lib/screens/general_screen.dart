import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshgarden/controller/cart_controller.dart';
import 'package:freshgarden/controller/product_controller.dart';
import 'package:freshgarden/widgets/drawer_widget.dart';
import 'package:freshgarden/widgets/home_tab_items.dart';
import 'package:get/get.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen>
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

  bool isSwitched = false;
  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = !isSwitched;
    });
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
              'General',
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Currency',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 5.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'VN - đ',
                        style: TextStyle(
                          color: Color(0xFF152935),
                          fontFamily: 'RobotoMedium',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                        // size: 20.0,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Decimal'),
                    Switch(
                      value: isSwitched,
                      onChanged: toggleSwitch,
                      activeColor: Colors.white,
                      activeTrackColor: Color(0xFF1CC3AC),
                      // inactiveThumbColor: Colors.grey,
                      // inactiveTrackColor: Colors.orange,
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
