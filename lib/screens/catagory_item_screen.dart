// ignore: file_names
import 'package:flutter/material.dart';
import 'package:meal_app/screens/catagory.dart';

import 'package:meal_app/dummy.dart';
import 'package:meal_app/widgets/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CatagoryItemScreen extends StatefulWidget {
  static const routes = '/category';
  final List<Meal> availablemeal;

  CatagoryItemScreen(this.availablemeal);

  @override
  State<CatagoryItemScreen> createState() => _CatagoryItemScreenState();
}

class _CatagoryItemScreenState extends State<CatagoryItemScreen> {
  late String cattitle;
  late List<Meal> displayedMeals;
  var _loadinit = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadinit) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      cattitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availablemeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadinit = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cattitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItems(
            imgurl: displayedMeals[index].imageUrl,
            titlee: displayedMeals[index].title,
            afford: displayedMeals[index].affordability,
            duration: displayedMeals[index].duration,
            id: displayedMeals[index].id,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
