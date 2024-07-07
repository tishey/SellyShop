import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellyshop/src/core/constants/network_constant.dart';
import 'package:sellyshop/src/core/utils/app_color.dart';
import 'package:sellyshop/src/core/utils/app_gap.dart';
import 'package:sellyshop/src/core/utils/naira_formater.dart';
import 'package:sellyshop/src/presentation/screens/home_screen.dart/data/model/product_model.dart';

class ProductDetaisScreen extends StatefulWidget {
  const ProductDetaisScreen(
      {super.key, required this.products, required this.index});

  final AsyncValue<List<Product>> products;
  final int index;

  @override
  State<ProductDetaisScreen> createState() => _ProductDetaisScreenState();
}

class _ProductDetaisScreenState extends State<ProductDetaisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: widget.products.when(
          data: (data) {
            final image =
                '$baseUrl/images/${data[widget.index].photos![0]['url']}';
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: AppSizes.screenWidth(context) / 1.1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        // decoration:
                        //     BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        // height: 250,
                        // width: AppSizes.screenWidth(context) / 1.1,
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(image: AssetImage(image))),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  AppSizes.addVerticalSpacing(10),
                  Row(
                    children: [
                      const Text(
                        '₦',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        nairaFormat(data[widget.index].currentPrice![0], 2),
                        style: GoogleFonts.redHatDisplay(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       padding: const EdgeInsets.symmetric(
                      //           vertical: 5, horizontal: 5),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5),
                      //           color: AppColor.appBrandColor),
                      //       child: const Icon(
                      //         Icons.add,
                      //         color: AppColor.whiteColor,
                      //       ),
                      //     ),
                      //     AppSizes.addHorizontalSpacing(5),
                      //     Text(
                      //       data.length.toString(),
                      //       style: GoogleFonts.redHatDisplay(fontSize: 20),
                      //     ),
                      //     AppSizes.addHorizontalSpacing(5),
                      //     Container(
                      //       padding: const EdgeInsets.symmetric(
                      //           vertical: 5, horizontal: 5),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5),
                      //           color: AppColor.appBrandColor),
                      //       child: const Icon(Icons.remove,
                      //           color: AppColor.whiteColor),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                  AppSizes.addVerticalSpacing(5),
                  Text(
                    data[widget.index].description ?? '',
                    style: GoogleFonts.redHatDisplay(),
                  )
                ],
              ),
            );
          },
          error: (e, s) => Text(e.toString()),
          loading: () => const CircularProgressIndicator(
                color: AppColor.appBrandColor,
              )),
    );
  }
}
