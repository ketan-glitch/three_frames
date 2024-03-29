import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/credential_model.dart';

class DataController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;

  DataController({required this.sharedPreferences});

  List<CredentialsModel> registeredUsers = [];
  CredentialsModel? user;

  bool isLoggedIn() {
    log("${sharedPreferences.containsKey('user')}");
    return sharedPreferences.containsKey('user');
  }

  initializeData() {
    registeredUsers = credentialsModelFromJson(sharedPreferences.getString('registered_users') ?? '[]');
    if (sharedPreferences.containsKey('user')) {
      user = CredentialsModel.fromJson(jsonDecode(sharedPreferences.getString('user')!));
      log("${user?.toJson()}");
    }
  }

  Future<bool> register({required String email, required String password}) async {
    CredentialsModel credentials = CredentialsModel.fromJson({
      'email': email,
      'password': password,
    });
    if (registeredUsers.isEmpty) {
      //Add new Entry
      addNewCredentials(credentials: credentials);
    } else {
      if (registeredUsers.where((element) => element.email == credentials.email).toList().isNotEmpty) {
        return false;
      } else {
        //Add new entry
        addNewCredentials(credentials: credentials);
      }
    }
    return true;
  }

  void addNewCredentials({required CredentialsModel credentials}) {
    registeredUsers.add(credentials);
    sharedPreferences.setString('registered_users', credentialsModelToJson(registeredUsers));
  }

  Future<bool> login({required String email, required String password}) async {
    CredentialsModel credentials = CredentialsModel.fromJson({
      'email': email,
      'password': password,
    });
    if (registeredUsers.where((element) => element.email == credentials.email && element.password == credentials.password).toList().isNotEmpty) {
      user = credentials;
      sharedPreferences.setString('user', jsonEncode(credentials.toJson()));
      return true;
    } else {
      return false;
    }
  }

  Future logout() async {
    _googleSignIn.signOut();
    sharedPreferences.remove('user');
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<bool> handleSignIn() async {
    try {
      return await _googleSignIn.signIn().then((value) {
        if (value != null) {
          CredentialsModel credentials = CredentialsModel.fromJson({
            'email': value.email,
            'password': 'password',
          });
          user = credentials;
          sharedPreferences.setString('user', jsonEncode(credentials.toJson()));
        }
        return true;
      });
    } catch (error) {
      log(error.toString());
      return false;
    }
  }
}
