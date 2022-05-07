import 'package:flutter/src/widgets/editable_text.dart';
import '../models/car.dart';
import '../models/parking.dart';
import '../models/reservation.dart';
import '../services/shared_prefes_manager.dart';
import '../services/user_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiManager {
  static const apiAddress = 'http://192.168.100.100:5000';
  static const loginAPIURL = apiAddress + '/api/users/login';
  static const registerAPIUrl = apiAddress + '/api/users/add';
  static const getUserAPIUrl = apiAddress + '/api/users/find';
  static const UserUpdateAPIUrl = apiAddress + '/api/users/update';

  static const parkingsAPIURL = apiAddress + '/api/parkings';
  static const carAPIURL = apiAddress + '/api/car';
  static const reclamationAPIURL = apiAddress + '/api/reclamation';
  static const resarvationAPIURL = apiAddress + '/api/parking/reserve';

  static Future<List<Parking>> getparkings() async {
    List<Parking> _parkings = [];
    try {
      final uri = Uri.parse(ApiManager.parkingsAPIURL);
      final headers = {'Content-Type': 'application/json'};
      var response = await http.Client().get(
        uri,
        headers: headers,
      );
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        String responseBody = response.body;
        var jsonResp = jsonDecode(responseBody);
        if (jsonResp != null) {
          for (var item in jsonResp) {
            Parking parking = Parking.fromJson(item);
            _parkings.add(parking);
          }
        }
        return _parkings;
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Car>> getcars(String owner_id) async {
    List<Car> _cars = [];
    try {
      final uri = Uri.parse(ApiManager.carAPIURL + "/" + owner_id);
      final headers = {'Content-Type': 'application/json'};
      var response = await http.Client().get(
        uri,
        headers: headers,
      );
      int statusCode = response.statusCode;
      if (statusCode == 201) {
        String responseBody = response.body;

        var jsonResp = jsonDecode(responseBody);
        if (jsonResp != null) {
          for (var item in jsonResp["car"]) {
            Car cars = Car.fromJson(item);
            _cars.add(cars);
          }
        }
        return _cars;
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> addCar(
      String number, String type, String description) async {
    try {
      final uri = Uri.parse(ApiManager.carAPIURL);
      final headers = {'Content-Type': 'application/json'};
      print(UserManager.currentUser!.id);
      Map<String, dynamic> body = {
        'number': number,
        'type': type,
        'description': description,
        'owner_id': UserManager.currentUser!.id,
      };
      String jsonBody = jsonEncode(body);
      print(jsonBody);
      final encoding = Encoding.getByName('utf-8');
      var response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );

      int statusCode = response.statusCode;
      String responseBody = response.body;
      var jsonResp = jsonDecode(responseBody);

      if (statusCode == 201) {
        // Signed up successfully
        return jsonResp["message"];
      } else {
        // Error signing up
        return jsonResp["message"];
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> DeleteCar(id) async {
    try {
      final uri = Uri.parse(ApiManager.carAPIURL + "/" + id);
      final headers = {'Content-Type': 'application/json'};

      var response = await http.delete(
        uri,
        headers: headers,
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

  static Future<String> carUpdate(
      String number, String description, String type, String id) async {
    try {
      final uri = Uri.parse(ApiManager.carAPIURL + "/" + id);
      final headers = {'Content-Type': 'application/json'};
      //var body = User(name: name,address: address,phone: phone).toJson();
      Map<String, String> body = {
        'number': number,
        'description': description,
        'type': type,
      };

      String jsonBody = json.encode(body);
      print(jsonBody);
      final encoding = Encoding.getByName('utf-8');
      var response = await http.put(
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

  static Future<String> createReclamation(
      name, email, address, description, status) async {
    try {
      final uri = Uri.parse(ApiManager.reclamationAPIURL);
      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        'name': name,
        'email': email,
        'address': address,
        'message': description,
        'status': status,
      };
      String jsonBody = jsonEncode(body);
      print(jsonBody);
      final encoding = Encoding.getByName('utf-8');
      var response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );
      int statusCode = response.statusCode;
      String responseBody = response.body;
      var jsonResp = jsonDecode(responseBody);

      if (statusCode == 201) {
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

  static Future<String> createResarvation(
      datetime, position, UserId, ParkingId) async {
    print(datetime);
    try {
      final uri = Uri.parse(ApiManager.resarvationAPIURL);
      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        "userId": UserId,
        "parkingid": ParkingId,
        "startingDate": datetime,
        "endingDate": null,
        "position": position,
        'status': "RESERVE",
      };
      String jsonBody = jsonEncode(body);
      print(jsonBody);
      final encoding = Encoding.getByName('utf-8');
      var response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );
      int statusCode = response.statusCode;
      String responseBody = response.body;
      var jsonResp = jsonDecode(responseBody);
      if (statusCode == 201) {
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

  static Future<List<Reservation>?> getreservationByUser(userId, status) async {
    List<Reservation> _reservation = [];
    print(userId);
    try {
      final uri = Uri.parse(
          ApiManager.resarvationAPIURL + "/" + userId + "?status=" + status);
      final headers = {'Content-Type': 'application/json'};
      var response = await http.Client().get(
        uri,
        headers: headers,
      );
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        String responseBody = response.body;

        var jsonResp = jsonDecode(responseBody);
        print(jsonResp);
        if (jsonResp != null) {
          for (var item in jsonResp) {
            Reservation reservations;
            if (status == "RESERVE") {
              reservations = Reservation.fromReserveJson(item);
            } else {
              reservations = Reservation.fromCheckOutJson(item);
            }

            _reservation.add(reservations);
          }
        }
        return _reservation;
      }
   
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> resarvationUpdate(String id) async {
    try {
      final uri = Uri.parse(ApiManager.resarvationAPIURL + "/" + id);
      final headers = {'Content-Type': 'application/json'};
      //var body = User(name: name,address: address,phone: phone).toJson();
      Map<String, String> body = {
        'status': "CHECKEDOUT",
        'endingDate': DateTime.now().toString(),
      };

      String jsonBody = json.encode(body);
      print(jsonBody);
      final encoding = Encoding.getByName('utf-8');
      var response = await http.put(
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

  static Future<String> resarvationdelete(String id) async {
    try {
      final uri = Uri.parse(ApiManager.resarvationAPIURL + "/" + id);
      final headers = {'Content-Type': 'application/json'};

      var response = await http.delete(
        uri,
        headers: headers,
      );

      int statusCode = response.statusCode;
      print(statusCode);
      String responseBody = response.body;
      var jsonResp = jsonDecode(responseBody);

      if (statusCode == 200) {
        // Signed up successfully
        return statusCode.toString();
      } else {
        // Error signing up
        return jsonResp['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }
}

  /*  static Future<List<Parking>> getparkings() async {
    List<Parking> _parkings = [];
    try {
      final uri = Uri.parse(ApiManager.parkingsAPIURL);
      final headers = {'Content-Type': 'application/json'};
      var response = await http.Client().get(
        uri,
        headers: headers,
      );

      int statusCode = response.statusCode;
      if(statusCode == 200){
      String responseBody = response.body;
      var jsonResp = jsonDecode(responseBody);

       if (jsonResp != null) {
        
         for (var item in jsonResp) {
        Parking w1 = Parking(
              name : item['Name'],
              adress : item['Adress'],
              description : item['description'],
              totalParkingLots : item['totalParkingLots'],
              totalFreeParkingLots : item['totalFreeParkingLots'],
              latitude : item['latitude'],
              longitude : item['longitude'],
              parkingFees : item['ParkingFees'],
              companyId : item['companyId'],
              status : item['Status'],
          );
        _parkings.add(w1);
      }
         
       }
        return _parkings;
      }
      return [];
    } catch (e) {
       print(e);
    }
  } */

