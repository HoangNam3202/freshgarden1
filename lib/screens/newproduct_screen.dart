import 'package:flutter/material.dart';
import 'package:freshgarden/widgets/newproduct_tab_product.dart';
import 'package:get/get.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFf6f6f6),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'New product',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.navigate_before,
                color: Colors.black,
                size: 24.0,
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 17.0),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                  size: 24.0,
                ),
              )
            ],
            bottom: TabBar(
              indicatorColor: const Color(0xFF1CC3AC),
              labelColor: const Color(0xFF1CC3AC),
              controller: _tabController,
              unselectedLabelColor: const Color(0xFFDBDBDB),
              tabs: const [
                Tab(
                  text: 'PRODUCT',
                ),
                Tab(
                  text: 'STOCK',
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [
              TabNewProduct(),
              Center(
                child: Text("It's categories here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
