import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/models/userModel.dart';
import 'package:projeto8cursoflutter/screens/loginScreen.dart';
import 'package:projeto8cursoflutter/tiles/orderTile.dart';

class OrdersTab extends StatelessWidget {
  final Color _ciano = Color(0xff007BA7);
  final Color _preto = Color(0xff1C1C1C);
  @override
  Widget build(BuildContext context) {
    if (userModel.of(context).isLoggedIn()) {
      String uid = userModel.of(context).firebaseUser.uid;
      return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("users")
            .document(uid)
            .collection("orders")
            .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
                children: snapshot.data.documents
                    .map((doc) => OrderTile(doc.documentID))
                    .toList());
          }
        },
      );
    } else {
      return Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.close,
                  color: _ciano,
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
                  shape: MaterialStateProperty.all(RoundedRectangleBorder()),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Log in to see your orders!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
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
    }
  }
}
