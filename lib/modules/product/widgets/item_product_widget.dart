import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:test_lime/data/models/res_product.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      width: 150,
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                product.images[0],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.brand,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              NumberFormat.currency(
                      locale: 'en', symbol: '\$ ', decimalDigits: 0)
                  .format(product.price -
                      product.price * product.discountPercentage / 100),
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.pink[200]),
                  child: Text(
                    ("${product.discountPercentage.toInt()}%"),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "\$ ${product.price}",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    "${product.rating}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
