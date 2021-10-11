import 'package:flutter/material.dart';

import 'package:meal_app/dummy.dart';
import 'package:meal_app/widgets/category_item.dart';
import 'package:meal_app/widgets/drawer.dart';

class CaregoriesScreen extends StatelessWidget {
  const CaregoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal app"),
      ),
      drawer: MainDrawer(),
      body: GridView(
        padding: EdgeInsets.all(25),
        children: dummyCategory
            .map((cat) => CategoryItem(cat.title, cat.color, cat.id))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
