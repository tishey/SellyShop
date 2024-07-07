import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellyshop/src/core/utils/naira_formater.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.price});
  final String? image;
  final String name;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: (MediaQuery.of(context).size.width * 0.3),
          width: (MediaQuery.of(context).size.width - 16) * 0.3,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 221, 237, 188),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              )),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.3) - 20,
                    height: (MediaQuery.of(context).size.width * 0.3) - 20,
                    child: image != null
                        ? Image.network(
                            image!,
                            fit: BoxFit.cover,
                          )
                        : const SizedBox.shrink()),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 16) * 0.3,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      name,
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    const Text(
                      "₦",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        width:
                            ((MediaQuery.of(context).size.width - 16) * 0.3) -
                                34,
                        child: Text(
                          nairaFormat(price, 0),
                          style: GoogleFonts.redHatDisplay(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
