import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/app_layout/app_layout.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginByAnyAccount extends StatefulWidget {
  const LoginByAnyAccount({key}) : super(key: key);

  @override
  State<LoginByAnyAccount> createState() => _LoginByAnyAccountState();
}

class _LoginByAnyAccountState extends State<LoginByAnyAccount> {
/*Login by Facebbok */
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

/*Login by google */

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildFacebook(),
        buildGoogle(),
        //buildTwitter(),
      ],
    );
  }

  Widget buildFacebook() {
    return Container(
      height: 100,
      width: 90,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () async {
          UserCredential facebookCred = await signInWithFacebook();
          // ignore: use_build_context_synchronously
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AppLayout(),
          ));
          // ignore: avoid_print
          print(facebookCred);
        },
        child: const Image(
          image: AssetImage("assets/images/icons8-facebook-100.png"),
        ),
      ),
    );
  }

  Widget buildGoogle() {
    return Container(
      height: 100,
      width: 95,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () async {
          UserCredential googleCred = await signInWithGoogle();
          // ignore: use_build_context_synchronously
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AppLayout(),
          ));

          // ignore: avoid_print
          print(googleCred);
        },
        child: Image.asset(
          "assets/images/google plus-logo.png",
        ),
      ),
    );
  }
}
