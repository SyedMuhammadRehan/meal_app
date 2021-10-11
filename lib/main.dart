import 'package:flutter/material.dart';
import 'package:meal_app/dummy.dart';
import 'package:meal_app/screens/bottom_navigation.dart';
import 'package:meal_app/screens/catagory_item_screen.dart';
import 'package:meal_app/screens/categorise_screen.dart';
import 'package:meal_app/screens/favorite.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/homescreen.dart';
import 'package:meal_app/screens/meal_item_details.dart';
import 'package:meal_app/widgets/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluton': false,
    'lactose': false,
    "vrgan": false,
    "vegetarian": false
  };
  List<Meal> _availablemeal = DUMMY_MEALS;
  List<Meal> _favorite = [];

  void _togglefavoritemeal(String mealid) {
    final existingmeal = _favorite.indexWhere((meal) => meal.id == mealid);
    if (existingmeal >= 0) {
      setState(() {
        _favorite.removeAt(existingmeal);
      });
    } else {
      _favorite.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealid));
    }
  }

  bool _isfavorite(String mealid) {
    return _favorite.any((meal) => meal.id == mealid);
  }

  void _applyfilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _availablemeal = DUMMY_MEALS.where((meals) {
        if (_filter['gluton']! && !meals.isGlutenFree) {}
        if (_filter['lactose']! && !meals.isLactoseFree) {
          return false;
        }
        if (_filter['vrgan']! && !meals.isVegan) {
          return false;
        }
        if (_filter['vegetarian']! && !meals.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 51, 1),
              ),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 51, 1)),
              subtitle1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoCondensed"),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => BottomNavigation(_favorite),
        CatagoryItemScreen.routes: (ctx) => CatagoryItemScreen(_availablemeal),
        MealDetails.routs: (ctx) =>
            MealDetails(_togglefavoritemeal, _isfavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_applyfilter, _filter),
        Favorite.route: (ctx) => Favorite(_favorite),
      },
    );
  }
}
