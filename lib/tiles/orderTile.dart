import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final Color _ciano = Color(0xff007BA7);

class OrderTile extends StatelessWidget {
  final String orderID;
  OrderTile(this.orderID);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
              .collection("orders")
              .document(orderID)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              int status = snapshot.data["status"];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Code: ${snapshot.data.documentID}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(_buildProductsText(snapshot.data)),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Order Status:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCircle("1", "Preparation", status, 1),
                      Container(
                        height: 1,
                        width: 40,
                        color: Colors.grey,
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                      _buildCircle("2", "Shipping", status, 2),
                      Container(
                        height: 1,
                        width: 40,
                        color: Colors.grey,
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                      _buildCircle("3", "Delivered", status, 3)
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  String _buildProductsText(DocumentSnapshot snapshot) {
    String text = "Description:\n";
    for (LinkedHashMap p in snapshot.data["products"]) {
      text +=
          "\n${p["quantity"]}x ${p["product"]["title"]} (R\$ ${p["product"]["price"].toStringAsFixed(2)})\n";
    }
    text += "\nTotal: R\$ ${snapshot.data["totalPrice"].toStringAsFixed(2)}";
    return text;
  }

  Widget _buildCircle(
      String title, String subtitle, int status, int thisStatus) {
    Color backColors;
    Widget child;
    if (status < thisStatus) {
      backColors = Colors.grey[500];
      child = Text(
        title,
        style: TextStyle(color: Colors.white),
      );
    } else if (status == thisStatus) {
      backColors = Colors.blue;
      child = Stack(
        alignment: Alignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      );
    } else {
      backColors = Colors.greenAccent[700];
      child = Icon(
        Icons.check,
        color: Colors.white,
      );
    }

    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: backColors,
          child: child,
        ),
        Text(subtitle)
      ],
    );
  }
}
