import 'package:task_to_isloo/apis.dart';
import 'package:task_to_isloo/model/product_model.dart';
import 'package:http/http.dart' as http;
class RemoteServices{
  static var client = http.Client();
  static Future<List<GetProducts>?> fetchProducts()async{
    var response = await client.get(Uri.parse('${Api.getProducts}'));
    if(response.statusCode == 200){
      var responseString = response.body;
      return getProductsFromJson(responseString);
    }else{return null;}
  }
}