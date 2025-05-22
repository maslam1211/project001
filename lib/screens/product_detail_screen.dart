import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project001/providers/products.dart';
import 'package:project001/providers/cart.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final product =
        Provider.of<Products>(context, listen: false).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 360,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFAEE1F9), Color(0xFFF7F8FA)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Center(
                  child: Hero(
                    tag: product.id,
                    child: Image.network(
                      product.imageUrl,
                      height: 260,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon:
                            const Icon(Icons.arrow_back, color: Colors.black87),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      IconButton(
                        icon: Icon(
                          product.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: product.isFavourite
                              ? Colors.red
                              : Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: () {
                          product.toggleFavorite();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  "Men's shoes",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 12),
                Row(
                  children: List.generate(
                    5,
                    (index) =>
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                  )..add(
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text('56 reviews',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                ),
                const SizedBox(height: 20),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  cart.addItem(product.id, product.price, product.title,
                      product.imageUrl);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Added to cart!"),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          cart.addItem(product.id, product.price,
                              product.description, product.imageUrl);
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
