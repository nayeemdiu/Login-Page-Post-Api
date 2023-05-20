import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login_page/dashboard.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();

  Future<bool> login(String emil, String password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': emil,
        "password": password,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);

        return true;
      } else {
        //
        // print('login failed');
        return false;
      }
    } catch (e) {
      return false;
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: emailcontroler,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: (BorderRadius.circular(30)),
                    ),
                    prefix: Padding(
                      padding: EdgeInsets.only(left: 18),
                      child: Icon(Icons.person),
                    ),
                    hintText: 'Enter your e-mail',
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: passwordcontroler,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Icon(Icons.lock_open),
                    ),
                    hintText: 'Enter your password',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  bool isLogin = await login(emailcontroler.text.toString(),
                      passwordcontroler.text.toString());

                  if (isLogin) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Dashbord()));
                  } else {
                    // ignore: use_build_context_synchronously
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Error",
                            ),
                            content: Text("please valid email or password"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ok'))
                            ],
                          );
                        });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: Center(
                      child: Text('Login'),
                    ),
                  ),
                ),

              )
            ],
          ),
        ),
      ),

    );
  }
}
