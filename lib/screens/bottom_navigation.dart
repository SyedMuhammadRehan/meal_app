import 'package:flutter/material.dart';
import 'package:meal_app/screens/categorise_screen.dart';
import 'package:meal_app/screens/favorite.dart';
import 'package:meal_app/widgets/drawer.dart';
import 'package:meal_app/widgets/meal.dart';

class BottomNavigation extends StatefulWidget {
  final List<Meal> _favorite;
  const BottomNavigation(this._favorite);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  void _selectedIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  late List<Widget> _listoptions;

  @override
  void initState() {
    _listoptions = [
      CaregoriesScreen(),
      Favorite(widget._favorite),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listoptions[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
          ],
          currentIndex: currentIndex,
          onTap: _selectedIndex,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.redAccent),
    );
  }
}
