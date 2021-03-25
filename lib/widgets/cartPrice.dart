import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/models/cartModel.dart';
import 'package:scoped_model/scoped_model.dart';

final Color _ciano = Color(0xff007BA7);

class CartPrice extends StatelessWidget {
  final VoidCallback buy;
  CartPrice(this.buy);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(16),
        child: ScopedModelDescendant<CartModel>(
          builder: (context, child, model) {
            double price = model.getProductsPrice();
            double discount = model.getDiscount();
            double ship = model.getShipPrice();
            double total = price + ship - discount;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Order details",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal"),
                      Text(
                        "\$ ${price.toStringAsFixed(2)}",
                        style: TextStyle(color: _ciano),
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Discount"),
                      Text(
                        "\$ ${discount.toStringAsFixed(2)}",
                        style: TextStyle(color: _ciano),
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping price"),
                      Text(
                        "\$ ${ship.toStringAsFixed(2)}",
                        style: TextStyle(color: _ciano),
                      )
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "\$ ${total.toStringAsFixed(2)}",
                        style: TextStyle(color: _ciano, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: buy,
                  child: Text("Checkout"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(_ciano)),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
