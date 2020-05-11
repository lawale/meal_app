import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatefulWidget {
  static const String route = "/meal-detail";

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  int currentSelection = 0;
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            MaterialSegmentedControl(
              horizontalPadding: EdgeInsets.all(20),
              children: _tabsTitle,
              unselectedColor: Colors.white,
              selectedColor: Theme.of(context).accentColor,
              selectionIndex: currentSelection,
              borderRadius: 24,
              onSegmentChosen: (index) {
                setState(() {
                  currentSelection = index;
                });
              },
            ),
            tabBody(context, meal),
          ],
        ),
      ),
    );
  }

  Map<int, Widget> _tabsTitle = const {
    0: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text("Ingredients"),
    ),
    1: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text("Steps"),
    ),
  };

  Widget tabBody(BuildContext context, Meal meal) {
    return currentSelection == 0
        ? buildSectionBody(
            ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      meal.ingredients[index],
                    ),
                  ),
                );
              },
              itemCount: meal.ingredients.length,
            ),
          )
        : buildSectionBody(
            ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}"),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: meal.steps.length,
            ),
          );
  }

  Container buildSectionBody(Widget child) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  Container buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
