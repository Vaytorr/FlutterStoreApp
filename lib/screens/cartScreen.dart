import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/models/cartModel.dart';
import 'package:projeto8cursoflutter/models/userModel.dart';
import 'package:projeto8cursoflutter/screens/HomeScreen.dart';
import 'package:projeto8cursoflutter/screens/loginScreen.dart';
import 'package:projeto8cursoflutter/screens/orderScreen.dart';
import 'package:projeto8cursoflutter/tiles/cartTile.dart';
import 'package:projeto8cursoflutter/widgets/cartPrice.dart';
import 'package:projeto8cursoflutter/widgets/discountCart.dart';
import 'package:scoped_model/scoped_model.dart';

final Color _ciano = Color(0xff007BA7);
final Color _preto = Color(0xff1C1C1C);

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: _preto,
        title: Text(
          "My Cart",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 8),
            child: ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                int p = model.products.length;
                return Text(
                  "${p ?? 0} ${p == 1 ? "item" : "items"}",
                  style: TextStyle(fontSize: 17, color: _ciano),
                );
              },
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<CartModel>(builder: (context, child, model) {
        userModel user = userModel.of(context);
        if (model.isLoading && user.isLoggedIn()) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!user.isLoggedIn()) {
          return Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.remove_shopping_cart_rounded,
                      color: Colors.red,
                      size: 100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(_ciano),
                      shape:
                          MaterialStateProperty.all(RoundedRectangleBorder()),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sign in to see your cart!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (model.products == null || model.products.length == 0) {
          return Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          "Nothing here yet ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.close_rounded,
                          color: Colors.red,
                          size: 50,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(_ciano),
                      shape:
                          MaterialStateProperty.all(RoundedRectangleBorder()),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Keep shopping",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return ListView(
            children: [
              Column(
                children: model.products.map((product) {
                  return CartTile(product);
                }).toList(),
              ),
              DiscountCart(),
              CartPrice(() async {
                String orderId = await model.finishOrder();
                if (orderId != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => OrderScreen(orderId)));
                }
              }),
            ],
          );
        }
      }),
    );
  }
}
