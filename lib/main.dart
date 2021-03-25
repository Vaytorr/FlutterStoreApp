import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/models/cartModel.dart';
import 'package:projeto8cursoflutter/models/userModel.dart';
import 'package:projeto8cursoflutter/screens/HomeScreen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<userModel>(
      model: userModel(),
      child: ScopedModelDescendant<userModel>(
        builder: (context, child, model) {
          return ScopedModel<CartModel>(
            model: CartModel(model),
            child: MaterialApp(
                title: 'Flutter`s Clothing',
                theme: ThemeData(
                    brightness: Brightness.light,
                    primarySwatch: Colors.blue,
                    primaryColor: Colors.white,
                    buttonColor: Colors.white),
                home: HomeScreen()),
          );
        },
      ),
    );
  }
}
