import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_item_details.dart';
import 'package:meal_app/widgets/meal.dart';

class MealItems extends StatelessWidget {
  final String id;
  final String imgurl;
  final String titlee;
  final Affordability afford;
  final int duration;
  final Complexity complexity;

  const MealItems({
    Key? key,
    required this.imgurl,
    required this.titlee,
    required this.afford,
    required this.duration,
    required this.id,
    required this.complexity,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (afford) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectmeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetails.routs, arguments: id)
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectmeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  child: Image.network(
                    imgurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                      padding: EdgeInsets.all(8),
                      width: 250,
                      color: Colors.black54,
                      child: Text(titlee,
                          style: TextStyle(color: Colors.white, fontSize: 26),
                          softWrap: true,
                          overflow: TextOverflow.fade)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [Icon(Icons.work), Text(complexityText)],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(affordabilityText)
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
