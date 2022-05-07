import 'dart:convert';
import '../models/user.dart';
import '../services/api_manger.dart';
import '../services/shared_prefes_manager.dart';
import 'package:http/http.dart';

class UserManager {
  static bool _loggedIn = false;

  static var _id;
   static User? currentUser;

  static User? user;


   //Initial setup of the class

  static initialize() async {
    _id = SharedPrefsManager.getUser();
    try {
      if (_id != "none") {
      final uri = Uri.parse(ApiManager.getUserAPIUrl+"?id="+_id);
      final headers = {'Content-Type': 'application/json'};
      final encoding = Encoding.getByName('utf-8');
      Response response = await get(
        uri,
        headers: headers,
      );
      int statusCode = response.statusCode;
      String responseBody = response.body;
      var jsonResp = jsonDecode(responseBody);
      if (jsonResp["message"] != null) {
          print("Not logged in");
          _loggedIn = false;
        } else {
          _loggedIn = true;
          currentUser = User.fromJson(jsonResp);
        }

      }
    } catch (e) {
      print("Could not connect !!!!");
      print(e);
    }
  }



  


  //Check if logged in

  static bool isLoggedIn() {
    return _loggedIn;
  }





  static Future<String> performUserLogin(String email, String password) async {
    try {
      final uri = Uri.parse(ApiManager.loginAPIURL);
      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {'email': email, 'password': password};
      String jsonBody = json.encode(body);
      final encoding = Encoding.getByName('utf-8');
      Response response = await post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );

      int statusCode = response.statusCode;
      String responseBody = response.body;
      var jsonResp = jsonDecode(responseBody);
      if (statusCode == 200) {
        //Logged in
        _loggedIn = true;
        User currentUser = User.fromJson(jsonResp);
        SharedPrefsManager.setUser(currentUser.id ?? "none");
        print('Got a user');
        
        return jsonResp['message'];
      } else {
        //Login error ...
        _loggedIn = false;
        return jsonResp['message'];
      }
    } catch (e) {
      print("performUserLogin");
      print(e);
      return e.toString();
    }
  }

  // Register new user

  static Future<String> performUserSignup(String name, String email,
      String address, String phone, String password) async {
    try {
      final uri = Uri.parse(ApiManager.registerAPIUrl);
      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        'name': name,
        'email': email,
        'address': address,
        'password': password,
        'phone': phone,
        'role': 'client',
      };

      String jsonBody = json.encode(body);
      final encoding = Encoding.getByName('utf-8');
      Response response = await post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );

      int statusCode = response.statusCode;
      String responseBody = response.body;
      var jsonResp = jsonDecode(responseBody);
      if (jsonResp['message'] == null) {
        // Signed up successfully
        return jsonResp['message'];
      } else {
        // Error signing up
        return jsonResp['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }

    static Future<String> UserUpdate(name, address, phone) async {
    _id = SharedPrefsManager.getUser();
    try {
      final uri = Uri.parse(ApiManager.UserUpdateAPIUrl+"/"+_id);
      final headers = {'Content-Type': 'application/json'};
      //var body = User(name: name,address: address,phone: phone).toJson();
      Map<String, String> body = {
        'name': name,
        'address': address,
        'phone': phone,
      };

      String jsonBody = json.encode(body);
      print(jsonBody);
      final encoding = Encoding.getByName('utf-8');
      Response response = await put(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );

      int statusCode = response.statusCode;
      String responseBody = response.body;
      var jsonResp = jsonDecode(responseBody);

      if (jsonResp['message'] == 200) {
        // Signed up successfully
        return jsonResp['message'];
      } else {
        // Error signing up
        return jsonResp['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }
}
