import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/models/cartModel.dart';

final Color _ciano = Color(0xff007BA7);

class DiscountCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: ExpansionTile(
        title: Text(
          "Discount Coupon",
          textAlign: TextAlign.start,
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        leading: Icon(
          Icons.card_giftcard_rounded,
          color: _ciano,
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              initialValue: CartModel.of(context).couponCode ?? "",
              onFieldSubmitted: (text) {
                Firestore.instance
                    .collection("coupons")
                    .document(text.toUpperCase())
                    .get()
                    .then((docsnap) {
                  if (docsnap.data != null) {
                    CartModel.of(context)
                        .setCupon(text, docsnap.data["percent"]);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${docsnap.data["percent"]}% Off"),
                        backgroundColor: _ciano));
                  } else {
                    CartModel.of(context).setCupon(null, 0);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Invalid Coupon"),
                      backgroundColor: Colors.red,
                    ));
                  }
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Type your coupon"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "${CartModel.of(context).discountPercentage}% OFF",
              style: TextStyle(color: Colors.white70, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
