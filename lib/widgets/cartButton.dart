import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/screens/cartScreen.dart';

final Color _ciano = Color(0xff007BA7);

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.shopping_cart_rounded,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CartScreen()));
      },
      backgroundColor: _ciano,
    );
  }
}
