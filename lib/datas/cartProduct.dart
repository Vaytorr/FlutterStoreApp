import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto8cursoflutter/datas/productData.dart';

class CartProduct {
  String cartID;
  //p = product
  String pID;
  String pCategory;

  int pQuantity;
  String pSize;

  ProductData productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document) {
    cartID = document.documentID;
    pCategory = document.data["category"];
    pID = document.data["pid"];
    pQuantity = document.data["quantity"];
    pSize = document.data["size"];
  }

  Map<String, dynamic> toMap() {
    return {
      "category": pCategory,
      "pid": pID,
      "quantity": pQuantity,
      "size": pSize,
      "product": productData.toResumedMap(),
    };
  }
}
