import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/login_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
  }

class _LoginPageState extends State<LoginPage> {
  // This widget is the root of your application.
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          body: Center(

              child: Container(
                margin: EdgeInsets.all(15),
                height: 300,
                decoration: BoxDecoration (
                border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO( 255, 220, 205,1),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Login",
                          style: TextStyle(fontSize: 25),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          label: Text("Email"),

                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,top :15.0 ,right: 15.0),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          label: Text("Password"),

                        ),

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                          onPressed: () async {

                              await LoginApi.fetch(emailController.text, passwordController.text);

                          }, child: Text(
                        "Sign In",style: TextStyle(color: Colors.black),)
                      ),
                    )


                  ],
                ),
              )

          ),
        );
  }
}