import 'package:flutter/material.dart';
import './main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const route = "/filter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters")),
      drawer: MainDrawer(),
      body: Center(
        child: Text("This is Filters Screen"),
      ),
    );
  }
}
