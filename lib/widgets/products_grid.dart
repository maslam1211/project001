import 'package:flutter/material.dart';
import 'package:project001/providers/products.dart';
import 'package:project001/widgets/product_tile.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final productList = productData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250, // Responsive column width
        childAspectRatio: 3 / 4, // Taller cards
        crossAxisSpacing: 15, // Space between columns
        mainAxisSpacing: 15, // Space between rows
      ),
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        print(
            "index is $index ${productList[index].title} isFavoriteStatus: ${productList[index].isFavourite}");
        return ChangeNotifierProvider.value(
          value: productList[index],
          child: const ProductTile(),
        );
      },
    );
  }
}
