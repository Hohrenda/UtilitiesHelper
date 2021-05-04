import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:utilities_helper/models/user_model.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthService {
  final _googleSignIn = GoogleSignIn(scopes: ['email']);
  final _firebaseInstance = FirebaseAuth.instance;

  Future<UserModel> checkCurrentUser() async {
    try {
      final firebaseUser = _firebaseInstance.currentUser;
      if (firebaseUser != null) {
        return UserModel(
            imageUrl: firebaseUser.photoURL, name: firebaseUser.displayName);
      }
    } catch (e) {
      return null;
    }
  }

  Future<UserModel> googleSignIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;

      if (googleUser == null) return null;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseInstance.signInWithCredential(credential);
      final user = await checkCurrentUser();
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<UserModel> facebookLogin() async {
    try{
      final facebookLogin = FacebookLogin();
      final FacebookLoginResult res = await facebookLogin.logIn(['email']);

      if(res.status == FacebookLoginStatus.loggedIn){
        final FacebookAccessToken accessToken = res.accessToken;
        AuthCredential _credential = FacebookAuthProvider.credential(accessToken.token);
        await FirebaseAuth.instance.signInWithCredential(_credential);
      }
      final user = await checkCurrentUser();
      return user;
    }catch(e){
      return null;
    }
  }


  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();
      await FacebookLogin().logOut();
      return true;
    } catch (e, s) {
      return false;
    }
  }
}
