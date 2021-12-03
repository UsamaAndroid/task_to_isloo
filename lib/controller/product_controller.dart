import 'package:get/get.dart';
import 'package:task_to_isloo/model/product_model.dart';
import 'package:task_to_isloo/remove_services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <GetProducts>[].obs;

  @override
  onInit() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
      // TODO
    }
    isLoading(false);
  }
}
