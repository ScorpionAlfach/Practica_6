import 'package:flutter/material.dart';

void main() {
  runApp(BasketballStoreApp());
}

class BasketballStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basketball Store',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ProductListScreen(),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // Список товаров
  List<Product> products = [
    Product(
      name: 'Air jordan 1 red',
      description: 'Удобная повседневная обувь.',
      imageUrl: 'assets/images/Air_jordan.jpg',
      price: 180.00,
    ),
    Product(
      name: 'Джерси Стефена Карри',
      description: 'Оригинальная игровая джерси.',
      imageUrl: 'assets/images/jersey.jpg',
      price: 260.00,
    ),
    Product(
      name: 'Мяч Wilson 3x3',
      description: 'Официальный мяч Fiba 3x3.',
      imageUrl: 'assets/images/Wilson.jpg',
      price: 100.00,
    ),
    Product(
      name: 'Air jordan 1 blue',
      description: 'Удобная повседневная обувь.',
      imageUrl: 'assets/images/Air_jordan_1_blue.jpg',
      price: 230.00,
    ),
    Product(
      name: 'Джерси Кевина Дюранта',
      description: 'Оригинальная игровая джерси.',
      imageUrl: 'assets/images/Jersey_KD.jpg',
      price: 180.00,
    ),
  ];

  // Set для хранения избранных товаров
  final Set<Product> _favorites = Set<Product>();

  // Метод для добавления или удаления товара из избранного
  void _toggleFavorite(Product product) {
    setState(() {
      if (_favorites.contains(product)) {
        _favorites.remove(product);
      } else {
        _favorites.add(product);
      }
    });
  }

  // Метод для удаления товара
  void _removeProduct(Product product) {
    setState(() {
      products.remove(product);
    });
  }

  // Навигация на страницу с карточкой товара
  void _navigateToProductDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basketball Store'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final isFavorite = _favorites.contains(product);

          return ListTile(
            leading: Image.asset(product.imageUrl, width: 50, height: 50),
            title: Text(product.name),
            subtitle: Text(
                '${product.description}\nPrice: \$${product.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: () => _toggleFavorite(product),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: const Color.fromARGB(255, 52, 51, 51),
                  onPressed: () => _removeProduct(product), // Удаление товара
                ),
              ],
            ),
            onTap: () => _navigateToProductDetail(
                product), // Переход на страницу товара при клике
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  // Конструктор для получения данных товара
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
