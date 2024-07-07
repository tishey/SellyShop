import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sellyshop/src/core/constants/network_constant.dart';
import 'package:sellyshop/src/core/service/api_service.dart';
import 'package:sellyshop/src/presentation/screens/home_screen.dart/data/model/product_model.dart';

final productProvider = Provider((ref) => ProductService());


class ProductService extends APIService {
  Future<List<Product>> fetchProducts() async {
    final response = await get('/products', token: token, queryParameters: {
      'organization_id': organizationID,
      'reverse_sort': 'false',
      'page': '1',
      'size': '10',
      'Appid': appID,
      'Apikey': apiKey,
    });

    List<Product> products = [];
    if (response['items'] != null) {
      for (var item in response['items']) {
        products.add(Product.fromJson(item));
      }
    }
    return products;
  }
}

