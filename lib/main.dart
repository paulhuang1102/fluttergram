import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'controllers/user_controller.dart';
import 'repositories/user_repository.dart';
import 'routes/app_pages.dart';
import 'services/amplify/amplify_service.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'models/user.dart';

User? currentUserModel;

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // after upgrading flutter this is now necessary
  await initialize();
  runApp(MyApp(title: 'Fluttergram'));
}

initialize() async {
  Get.lazyPut(() => UserController(UserRepository()));
}

Future<Null> _ensureLoggedIn(BuildContext context) async {
  // GoogleSignInAccount user = googleSignIn.currentUser;
  // if (user == null) {
  //   user = await googleSignIn.signInSilently();
  // }
  // if (user == null) {
  //   await googleSignIn.signIn();
  //   await tryCreateUserRecord(context);
  // }

  // if (auth.currentUser == null) {

  //   final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth = await googleUser
  //       .authentication;

  //   final FBA.GoogleAuthCredential credential = FBA.GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   await auth.signInWithCredential(credential);
  // }
}

Future<Null> _silentLogin(BuildContext context) async {
  // GoogleSignInAccount user = googleSignIn.currentUser;

  // if (user == null) {
  //   user = await googleSignIn.signInSilently();
  //   await tryCreateUserRecord(context);
  // }

  // if (await auth.currentUser == null && user != null) {
  //   final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth = await googleUser
  //       .authentication;

  //   final FBA.GoogleAuthCredential credential = FBA.GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   await auth.signInWithCredential(credential);
  // }
}

Future<Null> _setUpNotifications() async {
  if (Platform.isAndroid) {
    // _firebaseMessaging.getToken().then((token) {
    //   print("Firebase Messaging Token: " + token);

    //   FirebaseFirestore.instance
    //       .collection("insta_users")
    //       .doc(currentUserModel.id)
    //       .update({"androidNotificationToken": token});
    // });
  }
}

Future<void> tryCreateUserRecord(BuildContext context) async {
  // GoogleSignInAccount user = googleSignIn.currentUser;
  // if (user == null) {
  //   return null;
  // }
  // DocumentSnapshot userRecord = await ref.doc(user.id).get();
  // if (userRecord.data() == null) {
  //   // no user record exists, time to create

  //   String userName = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => Center(
  //               child: Scaffold(
  //                   appBar: AppBar(
  //                     leading: Container(),
  //                     title: Text('Fill out missing data',
  //                         style: TextStyle(
  //                             color: Colors.black,
  //                             fontWeight: FontWeight.bold)),
  //                     backgroundColor: Colors.white,
  //                   ),
  //                   body: ListView(
  //                     children: <Widget>[
  //                       Container(
  //                         child: CreateAccount(),
  //                       ),
  //                     ],
  //                   )),
  //             )),
  //   );

  //   if (userName != null || userName.length != 0) {
  //     ref.doc(user.id).set({
  //       "id": user.id,
  //       "username": userName,
  //       "photoUrl": user.photoUrl,
  //       "email": user.email,
  //       "displayName": user.displayName,
  //       "bio": "",
  //       "followers": {},
  //       "following": {},
  //     });
  //   }
  //   userRecord = await ref.doc(user.id).get();
  // }

  // currentUserModel = User.fromDocument(userRecord);
  return null;
}

class MyApp extends StatefulWidget {
  MyApp({required this.title}) : super();
  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool triedSilentLogin = false;
  bool setupNotifications = false;
  bool firebaseInitialized = false;

  _init() async {
    await AmplifyService().init();
    await UserController.to.checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fluttergram',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          buttonColor: Colors.pink,
          primaryIconTheme: IconThemeData(color: Colors.black)),
      initialRoute: '/home',
      getPages: AppPages.pages,
    );
  }

  void setUpNotifications() {
    _setUpNotifications();
    setState(() {
      setupNotifications = true;
    });
  }

  void silentLogin(BuildContext context) async {
    await _silentLogin(context);
    setState(() {
      triedSilentLogin = true;
    });
  }

  @override
  void initState() {
    _init();

    super.initState();
  }
}
