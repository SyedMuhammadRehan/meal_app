import 'package:flutter/material.dart';
import 'package:meal_app/dummy.dart';

class MealDetails extends StatelessWidget {
  final Function togglefavoritemeal;
  // final Function isfavoritee;
  final Function(String mealid) isfavorite;
  static const routs = '/meal-detail';

  MealDetails(this.togglefavoritemeal, this.isfavorite);

  Widget buildSectionTitle(BuildContext context, text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget buildSectionText(Widget child) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: 300,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                width: double.infinity,
                height: 300,
                child: Image.network(
                  '${selectedMeal.imageUrl}',
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(
                context,
                "Ingrediants",
              ),
              buildSectionText(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                      color: Theme.of(context).accentColor,
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(
                context,
                "Steps",
              ),
              buildSectionText(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple,
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ]),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => togglefavoritemeal(mealid),
          child: Icon(isfavorite(mealid) ? Icons.star : Icons.star_border),
        ));
  }
}
