import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshgarden/widgets/checkout_tab_items.dart';
import 'package:freshgarden/widgets/drawer_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen>
    with TickerProviderStateMixin {
  String drawerSeleted = 'Checkout';
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
            'Checkout',
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
            isScrollable: true,
            indicatorColor: const Color(0xFF1CC3AC),
            labelColor: const Color(0xFF1CC3AC),
            controller: _tabController,
            unselectedLabelColor: const Color(0xFFDBDBDB),
            labelStyle: const TextStyle(fontSize: 14.0),
            tabs: const [
              Tab(
                text: 'ALL',
              ),
              Tab(
                text: 'TRÁI CÂY',
              ),
              Tab(
                text: 'THỨC UỐNG',
              ),
              Tab(
                text: 'ĐỒ ĂN',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            CheckoutTabItems(),
            Center(
              child: Text("It's fruits here"),
            ),
            Center(
              child: Text("It's drinks here"),
            ),
            Center(
              child: Text("It's foods here"),
            ),
          ],
        ),
      ),
    );
  }
}
