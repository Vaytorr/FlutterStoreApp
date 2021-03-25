import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/datas/cartProduct.dart';
import 'package:projeto8cursoflutter/datas/productData.dart';
import 'package:projeto8cursoflutter/models/cartModel.dart';
import 'package:projeto8cursoflutter/models/userModel.dart';
import 'package:projeto8cursoflutter/screens/cartScreen.dart';
import 'package:projeto8cursoflutter/screens/loginScreen.dart';
import 'package:projeto8cursoflutter/widgets/cartButton.dart';

final Color _ciano = Color(0xff007BA7);
final Color _preto = Color(0xff1C1C1C);

class ProductScreen extends StatefulWidget {
  final ProductData product;

  ProductScreen(this.product);
  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  String size;
  final ProductData product;
  _ProductScreenState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CartButton(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: _preto,
        title: Text(
          product.title,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 4,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              autoplay: false,
              dotColor: _ciano,
              dotIncreasedColor: Colors.amber,
              animationDuration: Duration(milliseconds: 200),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  "\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, color: _ciano),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Size",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 34,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.5),
                    children: product.sizes.map((s) {
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                  color: s == size ? Colors.amber : _ciano,
                                  width: 3)),
                          width: 50,
                          alignment: Alignment.center,
                          child: Text(s),
                        ),
                        onTap: () {
                          setState(() {
                            size = s;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            size != null || !userModel.of(context).isLoggedIn()
                                ? _ciano
                                : Colors.grey[600]),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: size != null ||
                            !userModel.of(context).isLoggedIn()
                        ? () {
                            if (userModel.of(context).isLoggedIn()) {
                              CartProduct cartProduct = CartProduct();
                              cartProduct.pSize = size;
                              cartProduct.pQuantity = 1;
                              cartProduct.pID = product.id;
                              cartProduct.pCategory = product.category;
                              cartProduct.productData = product;
                              CartModel.of(context).addCartItem(cartProduct);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "Product added to cart",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: _ciano,
                                action: SnackBarAction(
                                  disabledTextColor: Colors.amberAccent,
                                  textColor: Colors.amberAccent,
                                  label: "Go to Cart",
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CartScreen()));
                                  },
                                ),
                              ));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            }
                          }
                        : null,
                    child: Text(
                      userModel.of(context).isLoggedIn()
                          ? "Add to Cart"
                          : "Sign in to buy",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500, color: _ciano),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 16),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
          )
        ],
      ),
    );
  }
}
