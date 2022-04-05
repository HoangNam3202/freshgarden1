import 'package:flutter/material.dart';
import 'package:freshgarden/controller/customer_controller.dart';
import 'package:freshgarden/models/customer_model.dart';
import 'package:freshgarden/widgets/newproduct_bottomsheet_image.dart';
import 'package:get/get.dart';

class NewCustomerScreen extends StatefulWidget {
  const NewCustomerScreen({Key? key}) : super(key: key);

  @override
  State<NewCustomerScreen> createState() => _NewCustomerScreenState();
}

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  final nameInput = TextEditingController();
  final mobileInput = TextEditingController();
  final addressInput = TextEditingController();
  final address2Input = TextEditingController();
  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = nameInput.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
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
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                )),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height - 80,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40.0,
                      right: 40.0,
                      top: 38.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return const BottomSheetWidget();
                                },
                              );
                            },
                            child: Container(
                              width: 124.0,
                              height: 124.0,
                              // color: const Color(0xFF1CC3AC),
                              // ignore: unrelated_type_equality_checks
                              child: Image.asset('images/customer_avatar.png',
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 68.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('Name'),
                  ),
                  Container(
                    color: Colors.white,
                    height: 50.0,
                    margin: EdgeInsets.only(top: 2.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: TextFormField(
                        controller: nameInput,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Lorem Ipsum',
                          // errorText: _errorText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('Mobile #1'),
                  ),
                  Container(
                    color: Colors.white,
                    height: 50.0,
                    margin: EdgeInsets.only(top: 2.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: TextField(
                        controller: mobileInput,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Lorem Ipsum',
                          counterText: '',
                        ),
                        maxLength: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('Address #1'),
                  ),
                  Container(
                    color: Colors.white,
                    height: 50.0,
                    margin: EdgeInsets.only(top: 2.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: TextField(
                        controller: addressInput,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Lorem Ipsum',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('Address #2'),
                  ),
                  Container(
                    color: Colors.white,
                    height: 50.0,
                    margin: EdgeInsets.only(top: 2.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: TextField(
                        controller: address2Input,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Lorem Ipsum',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          if (nameInput.text != null &&
                              nameInput.text.isEmpty) {
                            final snackBar = SnackBar(
                              content: Text('Please enter a Name'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            if (mobileInput.text != null &&
                                mobileInput.text.isEmpty) {
                              final snackBar = SnackBar(
                                content: Text('Please enter a Mobile'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              if (addressInput.text != null &&
                                  addressInput.text.isEmpty) {
                                final snackBar = SnackBar(
                                  content: Text('Please enter a Adrress #1'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                if (address2Input.text != null &&
                                    address2Input.text.isEmpty) {
                                  final snackBar = SnackBar(
                                    content: Text('Please enter a Adrress #2'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  Get.put(CustomerController())
                                      .addCustomer(CustomerModel(
                                    name: nameInput.text,
                                    mobile: mobileInput.text,
                                    address: addressInput.text,
                                    address2: address2Input.text,
                                  ));
                                  final snackBar = SnackBar(
                                    content: Text(
                                        'Customer "${nameInput.text}" has been added to your list'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  nameInput.text = '';
                                  mobileInput.text = '';
                                  addressInput.text = '';
                                  address2Input.text = '';
                                  FocusScope.of(context).unfocus();
                                }
                              }
                            }
                          }
                        },
                        child: Container(
                          // width: MediaQuery.of(context).size.width,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1CC3AC),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              'save'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'RobotoMedium',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
