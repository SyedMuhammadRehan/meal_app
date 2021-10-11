import 'package:flutter/material.dart';
import 'package:meal_app/widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function(Map<String, bool>) applyfilter;
  final Map<String, bool> currentfilter;
  FiltersScreen(this.applyfilter, this.currentfilter);
  static const routeName = '/filter';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitchTile(String title, String subTitle, var currentVal,
      Function(bool) nextQuestion) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentVal,
      activeColor: Colors.redAccent,
      onChanged: nextQuestion,
    );
  }

  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegan = false;
  var isVegetarian = false;
  initState() {
    isGlutenFree = widget.currentfilter['gluton'] as bool;
    isLactoseFree = widget.currentfilter['lactose'] as bool;
    isVegan = widget.currentfilter['vrgan'] as bool;
    isVegetarian = widget.currentfilter['vegetarian'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Screen"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedfilter = {
                  'gluton': isGlutenFree,
                  'lactose': isLactoseFree,
                  "vrgan": isVegan,
                  "vegetarian": isVegetarian
                };
                widget.applyfilter(selectedfilter);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Text(
            "Adjust your filters here",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchTile(
                "Glutan-Free", "only include Glutan-Free meal", isGlutenFree,
                (newValue) {
              setState(() {
                isGlutenFree = newValue;
              });
            }),
            _buildSwitchTile(
                "Lactose-Free", "only include Lactose-Free meal", isLactoseFree,
                (newValue) {
              setState(() {
                isLactoseFree = newValue;
              });
            }),
            _buildSwitchTile(
                "Vegan-Free", "only include Vegan-Free meal", isVegan,
                (newValue) {
              setState(() {
                isVegan = newValue;
              });
            }),
            _buildSwitchTile("Vegetarian-Free",
                "only include Vegetarian-Free meal", isVegetarian, (newValue) {
              setState(() {
                isVegetarian = newValue;
              });
            }),
          ],
        ))
      ]),
    );
  }
}
