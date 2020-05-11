import 'package:flutter/material.dart';
import '../screens/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, Object>> _pages = [
    {"name": "Categories", "page": CategoriesScreen()},
    {"name": "Favorites", "page": FavoriteScreen()}
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]["name"],),
      ),
      drawer: MainDrawer(),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            )
          : null,
      body: _pages[_selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorites"),
          )
        ],
        currentIndex: _selectedIndex,
        elevation: 6,
        backgroundColor: Colors.white70,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
