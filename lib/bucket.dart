import 'package:flutter/material.dart';
import 'product.dart';

class FavoriteScreen extends StatelessWidget {
  final Set<Product> favorites;
  final Function(Product) toggleFavorite;

  FavoriteScreen({required this.favorites, required this.toggleFavorite});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final product = favorites.elementAt(index);

        return ListTile(
          leading: Image.asset(product.imageUrl, width: 50, height: 50),
          title: Text(product.name),
          subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
          trailing: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Удалить товар из избранного
              toggleFavorite(product);
            },
          ),
        );
      },
    );
  }
}
