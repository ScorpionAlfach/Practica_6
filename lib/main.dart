import 'package:flutter/material.dart'; 
import 'catalog.dart';
import 'bucket.dart';
import 'profile.dart';
import 'product.dart';
import 'cart_screen.dart';

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
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white, // Цвет фона
          selectedItemColor: const Color.fromARGB(255, 103, 101, 96), // Цвет активных иконок
          unselectedItemColor: const Color.fromARGB(206, 167, 166, 164), // Цвет неактивных иконок
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final Set<Product> _favorites = Set<Product>();
  final List<Product> _cart = [];

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleFavorite(Product product) {
    setState(() {
      if (_favorites.contains(product)) {
        _favorites.remove(product);
      } else {
        _favorites.add(product);
      }
    });
  }

  void _addToCart(Product product) {
    setState(() {
      _cart.add(product);
    });
  }

  void _removeFromCart(Product product) {
    setState(() {
      _cart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      ProductListScreen(
        products: products,
        toggleFavorite: _toggleFavorite,
        addToCart: _addToCart,
        favorites: _favorites,
      ),
      FavoriteScreen(
        favorites: _favorites,
        toggleFavorite: _toggleFavorite,
      ),
      CartScreen(
        cartItems: _cart,
        removeFromCart: _removeFromCart,
      ),
      ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Basketball Store'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
