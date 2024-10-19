import 'package:flutter/material.dart';
import 'product.dart'; // Импорт модели Product

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.imageUrl, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Добавление в корзину
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} добавлен в корзину')),
                );
              },
              child: Text('Добавить в корзину'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 112, 212, 234),
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize:
                    Size(double.infinity, 50), // Ширина кнопки на весь экран
              ),
            ),
          ],
        ),
      ),
    );
  }
}
