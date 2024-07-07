import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sellyshop/src/core/service/exceptions.dart';

import 'package:sellyshop/src/presentation/screens/home_screen.dart/data/model/product_model.dart';
import 'package:sellyshop/src/presentation/screens/home_screen.dart/data/service/product_service.dart';

// final productStateNotifierProvider =
//     StateNotifierProvider<ProductStaeNotifier, AsyncValue<List<Map<String, dynamic>>>>(
//         (ref) => ProductStaeNotifier(ref));

// class ProductStaeNotifier extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
//   ProductStaeNotifier(this.ref) : super(const AsyncLoading()) {
//     fetchProductList();
//   }
//   Ref ref;
//   Future<void> fetchProductList() async {
//     try {
//       state = const AsyncLoading();
//       state = await AsyncValue.guard(() async {
//           print('RESPONSE1:');
//         final response = await ref.watch(productProvider).fetchProducts();
//         print('RESPONSE2: $response');
//         return response;
//       });
//     } on DioException catch (e) {
//       print('ERROR: $e');
//       final errorMessage = DioExceptions.fromDioError(e);
//       state = AsyncValue.error(errorMessage, StackTrace.current);
//     }
//   }
// }

final productStateNotifierProvider =
    StateNotifierProvider<ProductStaeNotifier, AsyncValue<List<Product>>>(
  (ref) => ProductStaeNotifier(ref),
);

class ProductStaeNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  ProductStaeNotifier(this.ref) : super(const AsyncLoading()) {
    fetchProductList();
  }

  final Ref ref;

  Future<void> fetchProductList() async {
    try {
      state = const AsyncLoading();
      final response = await ref.watch(productProvider).fetchProducts();

      state = AsyncValue.data(response);
    } on DioException catch (e) {
      print('Error fetching products: $e');
      print('StackTrace: ${StackTrace.current.toString()}');
      final errorMessage = DioExceptions.fromDioError(e);

      state = AsyncValue.error(errorMessage, StackTrace.current);
    }
  }
}
