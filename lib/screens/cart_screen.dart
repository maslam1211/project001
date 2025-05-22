import 'package:flutter/material.dart';
import 'package:project001/providers/cart.dart';
import 'package:project001/screens/place_order_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Chip(
                  label: Text(
                    "\$${cart.totalAmount.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  elevation: 4,
                ),
              ],
            ),
          ),
          Expanded(
            child: cart.itemCount == 0
                ? Center(
                    child: Text(
                      "Your cart is empty.",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.blueGrey[300],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: cart.itemCount,
                    itemBuilder: (ctx, index) {
                      final item = cart.items.values.toList()[index];
                      final key = cart.items.keys.toList()[index];

                      return Dismissible(
                        key: ValueKey(key),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          cart.removeItem(key);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${item.title} removed from cart'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        background: Container(
                          padding: const EdgeInsets.only(right: 20),
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          elevation: 2,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blueGrey[50],
                              radius: 26,
                              child: item.imageUrl.isNotEmpty
                                  ? ClipOval(
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/images/placeholder.png',
                                        image: item.imageUrl,
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
                                      ),
                                    )
                                  : Icon(
                                      Icons.image_not_supported,
                                      color: Colors.blueGrey[200],
                                    ),
                            ),
                            title: Text(
                              item.title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                            subtitle: Text(
                              "Total: \$${(item.price * item.quantity).toStringAsFixed(2)}",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.blueGrey[600],
                              ),
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "${item.quantity} x",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blueGrey[700],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[700],
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 6,
                shadowColor: Colors.blueGrey.withOpacity(0.5),
              ),
              child: const Text(
                "ORDER NOW",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  letterSpacing: 1.1,
                ),
              ),
              onPressed: cart.itemCount == 0
                  ? null
                  : () {
                      Navigator.of(context)
                          .pushNamed(PlaceOrderScreen.routeName);
                    },
            ),
          ),
        ],
      ),
    );
  }
}
