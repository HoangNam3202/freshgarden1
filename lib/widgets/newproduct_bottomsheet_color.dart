import 'package:flutter/material.dart';
import 'package:freshgarden/controller/product_controller.dart';
import 'package:get/get.dart';

class BottomSheetColorWidget extends StatefulWidget {
  const BottomSheetColorWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetColorWidget> createState() => _BottomSheetColorWidgetState();
}

class _BottomSheetColorWidgetState extends State<BottomSheetColorWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> color = [
      '0xFFBDBDBD',
      '0xFFF15F79',
      '0xFFF2994A',
      '0xFFFF2C94C',
      '0xFF1CC3AC',
      '0xFF27AE60',
      '0xFF56D2F3',
      '0xFFBB6BD9',
    ];
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
                  'Choose a color',
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
            child: Wrap(
              children: color.map(
                (item) {
                  return GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print(item.characters);
                      Get.put(ProductController()).onChangeColor(
                        item.characters.toString(),
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Color(int.parse(item.characters.toString())),
                          borderRadius: BorderRadius.circular(5.0)),
                      margin: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 20.0,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
