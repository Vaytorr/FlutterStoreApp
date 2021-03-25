import 'package:flutter/material.dart';
import 'package:projeto8cursoflutter/models/userModel.dart';
import 'package:projeto8cursoflutter/screens/loginScreen.dart';
import 'package:scoped_model/scoped_model.dart';

final Color _ciano = Color(0xff007BA7);
final _formKey = GlobalKey<FormState>();
final Color _preto = Color(0xff1C1C1C);
final _nameController = TextEditingController();
final _emailController = TextEditingController();
final _passController = TextEditingController();
final _adressController = TextEditingController();

final _scaffoldKey = GlobalKey<ScaffoldState>();

class singupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: _preto,
          title: Text(
            "Create Account",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
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
                      controller: _nameController,
                      validator: (text) {
                        if (text.isEmpty || text.length < 5) {
                          return "Invalid User";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white),
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
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (text) {
                        if (text.isEmpty ||
                            !text.contains("@") ||
                            !text.contains(".")) {
                          return "Invalid E-Mail";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "E-Mail",
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white),
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
                      controller: _passController,
                      validator: (text) {
                        if (text.isEmpty || text.length < 6) {
                          return "Invalid Password";
                        } else {
                          return null;
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white),
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
                      controller: _adressController,
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Invalid Address";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Address",
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white),
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
                      height: 12,
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text("Already have an account? Login!")),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        color: _ciano,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Map<String, dynamic> userData = {
                              "name": _nameController.text,
                              "email": _emailController.text,
                              "adress": _adressController.text
                            };
                            model.singUp(
                                userData: userData,
                                pass: _passController.text,
                                onSuccess: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        "Account successfully created!",
                                        textAlign: TextAlign.center),
                                    backgroundColor: _ciano,
                                    duration: Duration(seconds: 2),
                                  ));
                                  Future.delayed(Duration(seconds: 2))
                                      .then((_) {
                                    Navigator.of(context).pop();
                                  });
                                },
                                onFail: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        "Error while creating account!",
                                        textAlign: TextAlign.center),
                                    backgroundColor: Colors.redAccent,
                                    duration: Duration(seconds: 2),
                                  ));
                                });
                          }
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ));
  }
}
