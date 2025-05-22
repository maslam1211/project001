import 'package:flutter/material.dart';
import 'package:project001/providers/cart.dart';
import 'package:project001/providers/products.dart';
import 'package:project001/screens/cart_screen.dart';
import 'package:project001/screens/place_order_screen.dart';
import 'package:project001/screens/product_detail_screen.dart';
import 'package:project001/screens/product_overview_screen.dart';
import 'package:project001/screens/slash_screen.dart';
import 'package:project001/widgets/drawer_menu.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
   child: MaterialApp(
  title: 'Seeshooo',
  theme: ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
    ),
    
  ),

  // ✅ Start with the splash screen
  initialRoute: SplashScreen.routeName,

  // ✅ Register all routes here
  routes: {
    SplashScreen.routeName: (context) => SplashScreen(),
    '/': (context) => MyHomePage(title: 'Seeshooo'),
    ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
    CartScreen.routeName: (context) => CartScreen(),
    PlaceOrderScreen.routeName: (context) => PlaceOrderScreen(),
  },

  debugShowCheckedModeBanner: false,
),
    );
  }
}

enum PopupValue {
  showFavorite,
  showAll,
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Badge(
            label: Text(cart.itemCount.toString()),
            child: IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (popupValue) {
              if (popupValue == PopupValue.showFavorite) {
                productContainer.showFavorite();
              } else {
                productContainer.showAll();
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: PopupValue.showFavorite,
                child: Text("Only Favorite"),
              ),
              const PopupMenuItem(
                value: PopupValue.showAll,
                child: Text("Show All"),
              ),
            ],
          ),
        ],
        title: Text(title),
        centerTitle: true,
      ),
      body: ProductOverviewScreen(),
      drawer: DrawerMenu(),
    );
  }
}
