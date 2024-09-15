import 'package:get/get.dart';
import 'package:mobileapp/exceptions/app_exceptions.dart';
import 'package:mobileapp/models/items_model.dart';
import 'package:mobileapp/services/api_services.dart';

class ItemController extends GetxService {
  ItemsModel? itemsModel;
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    fetchAllItems();
    super.onInit();
  }

  void fetchAllItems() async {
    try {
      isLoading.value = true;
      itemsModel = await ApiServices.fetchAllItems();
      Get.snackbar("Sucess", itemsModel?.message ?? "");
    } on AppExceptions catch (e) {
      Get.snackbar("Error", e.message);
    } catch (e) {
      Get.snackbar("Error", "An unknown error occured");
    } finally {
      isLoading.value = false;
    }
  }

  void deleteItems({required int id}) async {
    try {
      isLoading.value = true;
      itemsModel = await ApiServices.deleteItem(id: id);
      Get.snackbar("Sucess", itemsModel?.message ?? "");
    } on AppExceptions catch (e) {
      Get.snackbar("Error", e.message);
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }
}
