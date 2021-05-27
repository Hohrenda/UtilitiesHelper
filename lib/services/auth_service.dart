import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:utilities_helper/models/user_model.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthService {
  final _googleSignIn = GoogleSignIn(scopes: ['email']);
  final _firebaseInstace = FirebaseAuth.instance;
  final facebookLogin = FacebookLogin();

  Future<UserModel> checkCurrentUser() async {
    try {
      final firebaseUser = _firebaseInstace.currentUser;
      if (firebaseUser != null) {
        return UserModel(
          imageUrl: firebaseUser.photoURL ?? '',
          name: firebaseUser.displayName,
        );
      }
      print('User not found');
      return null;
    } catch (e, s) {
      print('error');
      return null;
    }
  }

  Future<UserModel> facebookSignIn() async {
    try {
      final FacebookLoginResult result = await facebookLogin.logIn(['email','public_profile']);


      if (result.status == FacebookLoginStatus.loggedIn){
        final FacebookAccessToken accessToken = result.accessToken;
        AuthCredential _credential = FacebookAuthProvider.credential(accessToken.token);
        var a = await FirebaseAuth.instance.signInWithCredential(_credential);
        print(a.user);
      }


      final user = await checkCurrentUser();
      print('Login Success');
      return user;
    } catch (e, s) {
      print('Signing error');
      return null;
    }
  }

  Future<UserModel> googleSignIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      if (googleAuth == null) {
        return null;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseInstace.signInWithCredential(credential);
      final user = await checkCurrentUser();
      print('Login Success');
      return user;
    } catch (e, s) {
      print('Signing error');
      return null;
    }
  }

  Future<bool> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await facebookLogin.logOut();
      await _googleSignIn.signOut();
      return true;
    } catch (e, s) {
      return false;
    }
  }
}
