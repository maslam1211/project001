import 'package:flutter/material.dart';
import 'package:project001/screens/cart_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: const BorderRadius.only(
                  // bottomLeft: Radius.circular(24),
                  // bottomRight: Radius.circular(24),
                  ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.blueGrey[900],
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 38,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Seeshooo',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.blueGrey),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
       
            },
          ),
          const Divider(indent: 16, endIndent: 16),
          ListTile(
            leading: const Icon(Icons.shopping_cart_outlined,
                color: Colors.blueGrey),
            title: const Text('My Cart'),
            onTap: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
          const Divider(indent: 16, endIndent: 16),
          ListTile(
            leading:
                const Icon(Icons.settings_outlined, color: Colors.blueGrey),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
           
            },
          ),
          const Divider(indent: 16, endIndent: 16),
          ListTile(
            leading: const Icon(Icons.logout_outlined, color: Colors.blueGrey),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            
            },
          ),
        ],
      ),
    );
  }
}
