import 'package:flutter/material.dart';
import 'product.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products;
  final Function(Product) toggleFavorite;
  final Function(Product) addToCart; // Добавляем callback для корзины
  final Set<Product> favorites;

  ProductListScreen({
    required this.products,
    required this.toggleFavorite,
    required this.addToCart,
    required this.favorites,
  });

  void _navigateToProductDetail(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final isFavorite = favorites.contains(product);

        return GestureDetector(
          onTap: () => _navigateToProductDetail(context, product),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product.imageUrl, height: 100, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.name),
                ),
                Text('\$${product.price.toStringAsFixed(2)}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                      ),
                      onPressed: () => toggleFavorite(product),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () => addToCart(product),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

