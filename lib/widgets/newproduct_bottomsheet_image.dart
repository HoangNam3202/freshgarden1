import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshgarden/controller/product_controller.dart';
import 'package:get/get.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 18.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Add a new Image',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: Color(0xFF979797),
                  ),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: Color(0xFF979797),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.put(ProductController()).shootImage();
              Navigator.pop(context);
            },
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.2,
                    color: Color(0xFF4D6D80),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 16.33,
                ),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Color(0xFF979797),
                      ),
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Color(0xFF979797)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.put(ProductController()).getImage();
              Navigator.pop(context);
            },
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.2,
                    color: Color(0xFF4D6D80),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 16.33,
                ),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: SvgPicture.asset(
                          'assets/newproduct_image.svg',
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.scaleDown,
                          color: const Color(0xFF979797),
                        )),
                    const Text(
                      'Library',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: Color(0xFF979797),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
