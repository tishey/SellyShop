import 'package:dio/dio.dart';
import 'package:sellyshop/src/core/constants/network_constant.dart';

class APIService {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: baseUrl, responseType: ResponseType.json));

  Future<Map<String, dynamic>> get(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      String? token,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {

      final Response response = await _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }

}


// class APIService {
//   final Dio _dio = Dio(BaseOptions(
//     baseUrl: "https://api.timbu.cloud",
//     responseType: ResponseType.json,
//   ));

//   Future<Map<String, dynamic>> get(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//     String? token,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final Response response = await _dio.get(
//         path,
//         queryParameters: queryParameters,
//         options: Options(headers: {
//           "Authorization": "Bearer $token",
//         }),
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );
//       print('Response 1');
//       if (response.statusCode == 200 ) {
//         print('Response 2');
//         return response.data;
//       } else {
//         print('Response 3');
//         throw Exception("Failed to load data");
//       }
//     } catch (e) {
//       print('Response 3');
//       rethrow;
//     }
//   }
// }
