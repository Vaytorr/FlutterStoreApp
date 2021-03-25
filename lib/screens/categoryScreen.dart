import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/datas/productData.dart';
import 'package:projeto8cursoflutter/tiles/ProductTile.dart';
import 'package:projeto8cursoflutter/widgets/cartButton.dart';

class CategoryScreen extends StatelessWidget {
  final Color _preto = Color(0xff1C1C1C);
  final DocumentSnapshot snapshot;

  CategoryScreen(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            floatingActionButton: CartButton(),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: _preto,
              title: Text(
                snapshot.data["title"],
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              bottom: TabBar(
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    icon: Icon(Icons.grid_on),
                  ),
                  Tab(
                    icon: Icon(Icons.list),
                  ),
                ],
              ),
            ),
            body: FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection("products")
                  .document(snapshot.documentID)
                  .collection("items")
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.data.documents.length > 0) {
                  return TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GridView.builder(
                          padding: EdgeInsets.all(4),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 4,
                                  childAspectRatio: 0.65),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            ProductData data = ProductData.fromDocument(
                                snapshot.data.documents[index]);
                            data.category = this.snapshot.documentID;
                            return ProductTile("grid", data);
                          }),
                      ListView.builder(
                        padding: EdgeInsets.all(4),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          ProductData data = ProductData.fromDocument(
                              snapshot.data.documents[index]);
                          data.category = this.snapshot.documentID;
                          return ProductTile("list", data);
                        },
                      )
                    ],
                  );
                } else {
                  return Center(
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
                  );
                }
              },
            )));
  }
}
