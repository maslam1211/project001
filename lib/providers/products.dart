import 'package:flutter/material.dart';
import 'package:project001/model/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: '1',
      title: 'Running Shoes',
      description:
          'Lightweight and comfortable running shoes for everyday jogs.',
      price: 79.99,
      imageUrl:
          'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQqs57JBE5gadeMbTWePJrK1blt2OEClbj1WcTd9UgDb_7cW8nDRq4ktW0QEe_D-DNrATOZvblnnK5k6iStKl_3vQd7amM2QM70G03bR67taZzo5Rd1kGkb2Q ',
    ),
    Product(
      id: '3',
      title: 'Formal Leather Shoes',
      description:
          'Elegant leather shoes perfect for office and formal events.',
      price: 99.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcREGqtp-YYJUtbYD6ShIVu7GHNbEIZTN3TfCqVSDDdr_VyVZF74WbjTYT8AX33ox5lhpipW0pw2ZoP-E-WJwQzGOMdmaLmAjJ10BQGH4bYgH4wqjzIILGfsNSw',
    ),
    Product(
      id: '4',
      title: 'High Heels',
      description: 'Classic high heels for a stylish and classy look.',
      price: 89.99,
      imageUrl:
          'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTgxPxB3v8QhWn3xoCMl9FjsYunmI1YP0a-cKPzpraUC89XEG-d59gN46nbr0iMTtBXQ9Wj-XoDstOf0tBr5uYlreOpvWZnTg',
    ),
    Product(
      id: '5',
      title: 'Hiking Boots',
      description: 'Durable hiking boots designed for tough terrains.',
      price: 120.00,
      imageUrl:
          'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTMzHYUOqC4_owmE_cyOWcQpE7t0CgBCGcaANtddR5iTYqvwMrLK89kpGHHTKXfLRilzDuUjpX8ivJgnGEcPCnDYYEkYO4Gr-s0QwWhHy_giXSqAt3okrfN',
    ),
    Product(
      id: '6',
      title: 'Slip-On Loafers',
      description: 'Comfortable slip-on loafers for casual outings.',
      price: 65.50,
      imageUrl:
          'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTU0G9NGLq4ZteIQsL5v3miTDLmNiI9KC9ZR3YyY3D8G9cRNCleT8RNQfnCgumMZQqXNzPOtfj35VuwGjs6bAjXlAuKFu0aINub77X_Aurig2zFIvQOI0ZUnw',
    ),
    Product(
      id: '7',
      title: 'Sports Sandals',
      description: 'Breathable and sturdy sandals for outdoor sports.',
      price: 49.99,
      imageUrl:
          'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ5J1Ns2-C77VGnQbrRoBJlYwUgP9nfJg3G1Axv2iPSt17Y5MAf2ATdCPIjS9-QIgb5OUozWexm_oVa8W_z8ksaV3CDDTWDWeOX_N3_O-9TieKfju0IG9WY',
    ),
    Product(
      id: '8',
      title: 'Basketball Shoes',
      description: 'High-performance basketball shoes for maximum support.',
      price: 110.00,
      imageUrl:
          'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQF1E_ZpYXYofL-bHNcIDast8aEQYeZNk8Xha-pnupm_SdAhCufOck_HS3hS7NhKPQaJUVD95tDFdbQ-R-Tdh60s-qXgmD3iU_B578Xzl3F8Jj8mOA6cbjg0zM',
    ),
  ];

  var isFavoriteTapped = false;

  List<Product> get items {
    if (isFavoriteTapped) {
      return _items.where((product) => product.isFavourite).toList();
    }
    return [..._items];
  }

  Product findById(String productId) {
    return _items.firstWhere((p) => p.id == productId);
  }

  void showFavorite() {
    isFavoriteTapped = true;
    print("show favourite flag ON");
    notifyListeners();
  }

  void showAll() {
    isFavoriteTapped = false;
    print("show favourite flag OFF");
    notifyListeners();
  }
}
