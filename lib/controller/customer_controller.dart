import 'package:freshgarden/models/customer_model.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  RxList<CustomerModel> customers = RxList<CustomerModel>([
    CustomerModel(
      name: 'Customer 1',
      mobile: '0987654321',
      address: '74 Tran Thi Noi',
      address2: '74 Tran Thi Noi',
    ),
    CustomerModel(
      name: 'Customer 2',
      mobile: '0987654322',
      address: '76 Tran Thi Noi',
      address2: '76 Tran Thi Noi',
    ),
    CustomerModel(
      name: 'Customer 3',
      mobile: '0987654323',
      address: '78 Tran Thi Noi',
      address2: '78 Tran Thi Noi',
    ),
  ]);

  void addCustomer(CustomerModel customerModel) {
    customers.add(customerModel);
    update();
  }
}
