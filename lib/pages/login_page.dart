import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
    // var res = await AmplifyService().Auth.signinGoogle();
  }

  void fbLogin() async {
    // var res = await AmplifyService().Auth.signFB();
  }
}
