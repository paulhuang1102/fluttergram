import 'package:Fluttergram/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final userController = UserController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 240.0),
          child: Column(
            children: <Widget>[
              Text(
                'Fluttergram',
                style: TextStyle(
                    fontSize: 60.0,
                    fontFamily: "Billabong",
                    color: Colors.black),
              ),
              Padding(padding: const EdgeInsets.only(bottom: 100.0)),
              GestureDetector(
                onTap: googleLogin,
                child: Image.asset(
                  "assets/images/google_signin_button.png",
                  width: 225.0,
                ),
              ),
              ElevatedButton(onPressed: fbLogin, child: Text('Facebook'))
            ],
          ),
        ),
      ),
    );
  }

  void googleLogin() async {
    await userController.loginWithGoogle();
  }

  void fbLogin() async {}
}
