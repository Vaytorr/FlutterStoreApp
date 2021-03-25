import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/models/userModel.dart';
import 'package:projeto8cursoflutter/screens/loginScreen.dart';
import 'package:projeto8cursoflutter/tiles/DrawerTile.dart';
import 'package:scoped_model/scoped_model.dart';

typedef TitleCallback = void Function(String, int);

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    final Color _preto = Color(0xff1C1C1C);
    final Color _ciano = Color(0xff007BA7);
    Widget _BuildDrawerBackground() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 220, 255, 255), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );
    return Drawer(
      child: Stack(
        children: [
          _BuildDrawerBackground(),
          ListView(
            padding: EdgeInsets.only(top: 16),
            children: [
              Container(
                margin: EdgeInsets.only(left: 16, bottom: 8),
                padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 170,
                child: Stack(
                  children: [
                    Positioned(
                        top: 8,
                        left: 0,
                        child: Text(
                          "Flutter`s\n  Clothing",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: _preto),
                        )),
                    Positioned(
                        left: 0,
                        bottom: 0,
                        child: ScopedModelDescendant<userModel>(
                          builder: (context, child, model) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: _preto),
                                ),
                                GestureDetector(
                                  child: Text(
                                    model.isLoggedIn()
                                        ? "Exit"
                                        : "Log In or Sign in",
                                    style: TextStyle(
                                        color: _ciano,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    !model.isLoggedIn()
                                        ? Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()))
                                        : model.singOut();
                                  },
                                )
                              ],
                            );
                          },
                        ))
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Home", pageController, 0),
              DrawerTile(Icons.list, "Products", pageController, 1),
              DrawerTile(Icons.location_on, "Our Stores", pageController, 2),
              DrawerTile(
                  Icons.playlist_add_check, "My Orders", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
