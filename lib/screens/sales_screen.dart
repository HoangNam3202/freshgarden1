import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshgarden/controller/cart_controller.dart';
import 'package:freshgarden/controller/product_controller.dart';
import 'package:freshgarden/models/chart_model.dart';
import 'package:freshgarden/models/chartline_model.dart';
import 'package:freshgarden/screens/general_screen.dart';
import 'package:freshgarden/widgets/drawer_widget.dart';
import 'package:freshgarden/widgets/home_tab_items.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SalesScreen extends StatefulWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen>
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
  bool chartType = true;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartModel, String>> series = [
      charts.Series(
        data: chartsData,
        id: 'Chart Demo',
        domainFn: (ChartModel pops, _) => pops.year,
        measureFn: (ChartModel pops, _) => pops.population,
        colorFn: (ChartModel pops, _) =>
            charts.ColorUtil.fromDartColor(pops.barColor),
      )
    ];
    List<charts.Series<ChartLineModel, DateTime>> seriesLine = [
      charts.Series(
        data: chartslineData,
        id: 'Chart Demo',
        domainFn: (ChartLineModel pops, _) => pops.year,
        measureFn: (ChartLineModel pops, _) => pops.population,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xFF3B1A40)),
      )
    ];
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF6F6F6),
        drawer: const DrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Sales',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.navigate_before),
            color: Colors.black,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 6.75,
                  bottom: 2,
                ),
                child: const Text(
                  'Chart',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    chartType == true
                        ? Text('By Month')
                        : Text('Straight line chart'),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (chartType == true) {
                            chartType = false;
                          } else {
                            chartType = true;
                          }
                          print(chartType);
                        });
                      },
                      child: Icon(
                        Icons.filter_list,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 33.0,
              ),
              child: chartType == true
                  ? Column(
                      children: [
                        Row(
                          children: [
                            const RotatedBox(
                              quarterTurns: -1,
                              child: Text(
                                'USAGE (\$)',
                                style: TextStyle(
                                    fontFamily: 'Helvetica', fontSize: 10.0),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 50,
                              margin: EdgeInsets.only(left: 19.27),
                              height: 200.0,
                              child: charts.BarChart(series),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 22.0,
                        ),
                        const Text(
                          'MONTH',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      child: charts.TimeSeriesChart(seriesLine),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
