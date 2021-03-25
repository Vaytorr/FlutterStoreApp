import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/tabs/HomeTab.dart';
import 'package:projeto8cursoflutter/tabs/ordersTab.dart';
import 'package:projeto8cursoflutter/tabs/placesTab.dart';
import 'package:projeto8cursoflutter/tabs/productsTab.dart';
import 'package:projeto8cursoflutter/widgets/CustomDrawer.dart';
import 'package:projeto8cursoflutter/widgets/cartButton.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  final Color _preto = Color(0xff1C1C1C);

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure you want to leave the app?'),
              actions: <Widget>[
                new TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: new Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
        onWillPop: _onWillPop,
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Scaffold(
              body: HomeTab(),
              drawer: CustomDrawer(_pageController),
              floatingActionButton: CartButton(),
            ),
            Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                title: Text(
                  "Products",
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                backgroundColor: _preto,
              ),
              drawer: CustomDrawer(_pageController),
              floatingActionButton: CartButton(),
              body: ProductsTab(),
            ),
            Scaffold(
              appBar: AppBar(
                title: Text(
                  "Our Stores",
                  style: TextStyle(color: Colors.white),
                ),
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: _preto,
                centerTitle: true,
              ),
              drawer: CustomDrawer(_pageController),
              body: PlacesTab(),
            ),
            Scaffold(
              appBar: AppBar(
                title: Text(
                  "My Orders",
                  style: TextStyle(color: Colors.white),
                ),
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: _preto,
                centerTitle: true,
              ),
              body: OrdersTab(),
              drawer: CustomDrawer(_pageController),
            ),
          ],
        ));
  }
}
