import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../models/category.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String route = "/category-meals";
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final filteredMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            filteredMeals[index],
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
