import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/datas/cartProduct.dart';
import 'package:projeto8cursoflutter/datas/productData.dart';
import 'package:projeto8cursoflutter/models/cartModel.dart';

final Color _ciano = Color(0xff007BA7);
final Color _cianoFraco = Color(0xff28657d);

class CartTile extends StatelessWidget {
  final CartProduct cartProduct;
  CartTile(this.cartProduct);

  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      CartModel.of(context).updatePrices();
      return Row(
        children: [
          Container(
            width: 100,
            child: Image.network(
              cartProduct.productData.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 16, right: 8, top: 16, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartProduct.productData.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 17, color: _ciano),
                ),
                Text(
                  "Size: ${cartProduct.pSize}",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.white),
                ),
                Text(
                  "\$ ${cartProduct.productData.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: _cianoFraco),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        splashRadius: 20,
                        icon: Icon(
                          Icons.remove,
                          color: cartProduct.pQuantity > 1
                              ? _cianoFraco
                              : Colors.grey,
                        ),
                        onPressed: cartProduct.pQuantity > 1
                            ? () {
                                CartModel.of(context).decProduct(cartProduct);
                              }
                            : null),
                    Text(cartProduct.pQuantity.toString()),
                    IconButton(
                        splashRadius: 20,
                        icon: Icon(
                          Icons.add,
                          color: _cianoFraco,
                        ),
                        onPressed: () {
                          CartModel.of(context).incProduct(cartProduct);
                        }),
                    TextButton(
                        onPressed: () {
                          CartModel.of(context).removeCartItem(cartProduct);
                        },
                        child: Text(
                          "Remove",
                          style: TextStyle(color: Colors.redAccent),
                        ))
                  ],
                )
              ],
            ),
          ))
        ],
      );
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: cartProduct.productData == null
          ? FutureBuilder<DocumentSnapshot>(
              future: Firestore.instance
                  .collection("products")
                  .document(cartProduct.pCategory)
                  .collection("items")
                  .document(cartProduct.pID)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  cartProduct.productData =
                      ProductData.fromDocument(snapshot.data);
                  return _buildContent();
                } else {
                  return Container(
                    height: 70,
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  );
                }
              },
            )
          : _buildContent(),
    );
  }
}
