import "package:flutter/material.dart";
import "../widgets/main_drawer.dart";
import './favourites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>> _pages = [
    {
      "page":CategoriesScreen(),
      "title":"Categories"
    },
    {
      "page":FavouritesScreen(),
      "title":"Favourites"
    }
  ];
  int _selectPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      drawer:MainDrawer(),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            // ignore: deprecated_member_use
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            // ignore: deprecated_member_use
            title: Text("Favourites"),
          ),
        ],
      ),
    );
  }
}
