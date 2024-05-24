import 'package:fruitshop/local_storage/storage_utility.dart';
import 'package:fruitshop/providers/data_provider.dart';
import 'package:fruitshop/screens/mapbox/mapbox_screen.dart';
import 'package:fruitshop/screens/profile/widgets/payment_service.dart';
import 'package:fruitshop/screens/profile/widgets/profile_info.dart';
import 'package:fruitshop/screens/profile/widgets/purchase_detail.dart';
import 'package:fruitshop/screens/profile/widgets/purchase_history.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  String firstName = '';
  String lastName = '';
  String email = '';
  String address = '';
  String token = '';
  RxBool isLoading = true.obs;
  var orders = [].obs;

  void handleUserInfo() {
    TLocalStorage localStorage = TLocalStorage();
    Map<String, dynamic> dataUser = localStorage.readData('user');

    firstName = dataUser['firstname'];
    lastName = dataUser['lastname'];
    email = dataUser['email'];
    token = dataUser['token'];
  }

  void directionToInfo() {
    Get.to(() => const ProfileInfo());
  }

  void directionToPurchaseHistory() {
    Get.to(() => const PurchaseHistory());
  }

  void directionToMap() {
    Get.to(() => const MapBoxScreen());
  }

  void directionToPayment() {
    Get.to(() => const PaymentService());
  }

  void handleLogout() {
    /*delete data in local storage
      #Todo
    */
    TLocalStorage localStorage = TLocalStorage();
    localStorage.clearData();
    Get.offAllNamed('/signIn');
  }

  //order
  void getPurchaseHistory() {
    isLoading.value = true;
    DataProvider.getAllData(
            dataType: DataType.order, endpoint: "user/carts", token: token)
        .then((orders) {
      this.orders.value = orders;
      orders.reversed;
      isLoading.value = false;
    });
  }

  void viewOrderDetails(int index) {
    Get.to(() => PurchaseDetail(model: orders[index]));
  }

  @override
  Future<void> refresh() async {
    handleUserInfo();
    getPurchaseHistory();
  }

  @override
  void onInit() {
    refresh();
    super.onInit();
  }
}
