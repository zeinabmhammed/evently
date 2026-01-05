import 'package:evently/database/model/app_user.dart';
import 'package:evently/database/users_dao.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppAuthProvider extends ChangeNotifier {

  // save users in memory
  var _fbAuthUser = FirebaseAuth.instance.currentUser;
  AppUser? _databaseUser;

  
   AppAuthProvider(){
     retrieveUserFromDatabase();
  }

 AppUser? getUser(){
     return _databaseUser;
 }

  void logout(){
    _fb_authService.signOut();
    _fbAuthUser = null;
    _databaseUser = null;
    notifyListeners();
  }

  void retrieveUserFromDatabase() async {
    if (_fbAuthUser != null) {
      _databaseUser =  await UsersDao.getUserById(_fbAuthUser?.uid);
      notifyListeners();
    }
  }

  var _fb_authService = FirebaseAuth.instance;

  bool isLoggedInBefore (){
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    } else {
      return true;
    }

  }

  Future<AuthResponse> register(
    String email,
    String password,
    String name,
  ) async {
    try {
      final credential = await _fb_authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUser user = AppUser(
        id: credential.user?.uid,
        name: name,
        email: email,
      );
      await UsersDao.addUser(user);
      _databaseUser = user;
      _fbAuthUser = credential.user;

      return AuthResponse(success: true, credential: credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthFailure.weakPassword.code) {
        return AuthResponse(success: false, failure: AuthFailure.weakPassword);
      } else if (e.code == AuthFailure.emailInUse.code) {
        return AuthResponse(success: false, failure: AuthFailure.emailInUse);
      } else {
        return AuthResponse(success: false, failure: AuthFailure.general);
      }
    } catch (e) {
      return AuthResponse(success: false, failure: AuthFailure.general);
    }
  }


Future<AuthResponse> login(
    String email,
    String password,
    ) async {
  try {
    final credential = await _fb_authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    //retrieve user from database
    AppUser? user= await UsersDao.getUserById(credential.user?.uid);
    _databaseUser = user;
    _fbAuthUser = credential.user;


    return AuthResponse(success: true, credential: credential,
    user: user);
  } on FirebaseAuthException catch (e) {
    if (e.code == AuthFailure.invalidCredential.code) {
      return AuthResponse(success: false, failure: AuthFailure.invalidCredential);
    } else if (e.code == AuthFailure.invalidCredential.code) {
      return AuthResponse(success: false, failure: AuthFailure.invalidCredential);
    }
  } catch (e) {

  }
  return AuthResponse(success: false, failure: AuthFailure.general);
}
}
       //login with google

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
//------------------------------------------------------------------------------------
class AuthResponse {
  bool success;
  AuthFailure? failure;
  UserCredential? credential;
  AppUser? user;

  AuthResponse({
    required this.success,
    this.failure,
    this.credential,
    this.user
  });
}

enum AuthFailure {
  weakPassword('weak-password'),
  emailInUse('email-already-in-use'),
  general('Something went wrong'),
  invalidCredential('invalid-credential')
  ;

  final String code;
  const AuthFailure(this.code);
}
