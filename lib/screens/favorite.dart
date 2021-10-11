import 'package:flutter/material.dart';
import 'package:meal_app/widgets/drawer.dart';
import 'package:meal_app/widgets/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class Favorite extends StatefulWidget {
  static const String route = '/fvrt';
  final List<Meal> favorite;
  const Favorite(this.favorite);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    if (widget.favorite.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Favorite"),
        ),
        drawer: MainDrawer(),
        body: Center(
          child: Text("You have no favorite yet-start adding new"),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Favorite"),
        ),
        drawer: MainDrawer(),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItems(
              imgurl: widget.favorite[index].imageUrl,
              titlee: widget.favorite[index].title,
              afford: widget.favorite[index].affordability,
              duration: widget.favorite[index].duration,
              id: widget.favorite[index].id,
              complexity: widget.favorite[index].complexity,
            );
          },
          itemCount: widget.favorite.length,
        ),
      );
    }
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Favorite"),
    //   ),
    //   drawer: MainDrawer(),

    // );
  }
}
