import 'package:flutter/material.dart';
import './screens/filter_screen.dart';
import './screens/tab_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.orangeAccent,
        canvasColor: Colors.white,
        splashColor: Colors.deepOrangeAccent,
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(
                  backgroundColor: Colors.deepOrangeAccent,
                  foregroundColor: Colors.white,
                  elevation: 6,
                ),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: "/",
      routes: {
        "/": (_) => TabScreen(),
        CategoryMealsScreen.route: (_) => CategoryMealsScreen(),
        MealDetailScreen.route: (_) => MealDetailScreen(),
        FilterScreen.route: (_) => FilterScreen(),
      },
    );
  }
}
