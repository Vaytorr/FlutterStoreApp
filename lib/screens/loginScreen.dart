import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto8cursoflutter/models/userModel.dart';
import 'package:projeto8cursoflutter/screens/singupScreen.dart';
import 'package:scoped_model/scoped_model.dart';

final Color _ciano = Color(0xff007BA7);
final Color _preto = Color(0xff1C1C1C);
final _formKey = GlobalKey<FormState>();

final _emailController = TextEditingController();
final _passController = TextEditingController();

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: _preto,
        title: Text(
          "Sign in",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => singupScreen()));
            },
            child: Text(
              "CREATE AN ACCOUNT",
              style: TextStyle(fontSize: 15),
            ),
            textColor: _ciano,
          )
        ],
      ),
      body: ScopedModelDescendant<userModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty ||
                          !text.contains("@") ||
                          !text.contains(".")) {
                        return "Invalid email";
                      } else {
                        return null;
                      }
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "email",
                      hintStyle: TextStyle(
                        fontSize: 18.0,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _ciano),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: _ciano),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (text) {
                      if (text.isEmpty || text.length < 6) {
                        return "Invalid password";
                      } else {
                        return null;
                      }
                    },
                    controller: _passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontSize: 18.0,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _ciano),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: _ciano),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        if (_emailController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Insert the email linked to the account you want to recover",
                                textAlign: TextAlign.center),
                            backgroundColor: Colors.amber,
                            duration: Duration(seconds: 5),
                          ));
                        } else {
                          model.recoverPass(_emailController.text);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "If the email is correct an email will be sent to your inbox in a few minutes containing the password recovery link",
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: _ciano,
                            duration: Duration(seconds: 10),
                          ));
                        }
                      },
                      child: Text(
                        "Forgot my password",
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 44,
                    child: RaisedButton(
                      color: _ciano,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {}
                        model.singIn(
                            email: _emailController.text,
                            pass: _passController.text,
                            onSuccess: () {
                              Navigator.of(context).pop();
                            },
                            onFail: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "incorrect username or password!",
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Colors.redAccent,
                                duration: Duration(seconds: 2),
                              ));
                            });
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
