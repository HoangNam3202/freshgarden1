import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshgarden/controller/cart_controller.dart';
import 'package:freshgarden/controller/product_controller.dart';
import 'package:freshgarden/widgets/drawer_widget.dart';
import 'package:freshgarden/widgets/home_tab_items.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  String drawerSeleted = 'Products';
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    Get.put(ProductController()).drawerSeleted = 'Products';
    print('drawer: ${Get.put(ProductController()).drawerSeleted}');
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
            'Products',
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
          bottom: TabBar(
            indicatorColor: const Color(0xFF1CC3AC),
            labelColor: const Color(0xFF1CC3AC),
            controller: _tabController,
            unselectedLabelColor: const Color(0xFFDBDBDB),
            tabs: [
              GetBuilder<ProductController>(
                init: ProductController(),
                builder: (controller) => Tab(
                  text: 'ITEMS(${controller.products.length})',
                ),
              ),
              const Tab(
                text: 'STOCK',
              ),
              const Tab(
                text: 'CATEGORIES',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            TabItems(),
            Center(
              child: Text("It's stock here"),
            ),
            Center(
              child: Text("It's categories here"),
            ),
          ],
        ),
      ),
    );
  }
}
