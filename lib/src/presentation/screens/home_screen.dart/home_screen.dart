import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sellyshop/src/core/constants/network_constant.dart';
import 'package:sellyshop/src/core/navigator/app_navigator.dart';
import 'package:sellyshop/src/core/utils/app_color.dart';
import 'package:sellyshop/src/presentation/screens/home_screen.dart/product_details_screen.dart';
import 'package:sellyshop/src/presentation/screens/home_screen.dart/state/product_state.dart';
import 'package:sellyshop/src/presentation/screens/home_screen.dart/widget/product_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(productStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          res.when(
            data: (data) {
              return Expanded(
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemBuilder: (context, index) {
                    print(data[index].photos![0]['url']);
                    var imageUrl =
                        '$baseUrl/images/${data[index].photos![0]['url']}';
                    return GestureDetector(
                      onTap: () {
                        AppNavigator.push(ProductDetaisScreen(
                          products: res,
                          index: index,
                        ));
                      },
                      child: ProductWidget(
                        image: data[index].photos!.isNotEmpty ? imageUrl : '',
                        name: data[index].name,
                        price: data[index].currentPrice!.isNotEmpty
                            ? data[index].currentPrice![0]
                            : 0.0,
                      ),
                    );
                  },
                ),
              );
            },
            error: (error, stackTrace) {
              print(stackTrace.toString());
              return Text('Expired Token Error: $error');
            },
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: AppColor.appBrandColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
