import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/screens/HomeScreen.dart';

class OrderScreen extends StatelessWidget {
  final String orderID;
  final Color _preto = Color(0xff1C1C1C);
  final Color _ciano = Color(0xff007BA7);

  OrderScreen(this.orderID);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: _preto,
        title: Text(
          "Order Completed",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: _ciano,
              size: 80,
            ),
            Text(
              "Order successfully placed!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Order code: $orderID",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_ciano)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
