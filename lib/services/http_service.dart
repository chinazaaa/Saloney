import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:starter_project/models/http_response.dart';

class HttpService {
  //async - await
  // Promise
  static const String BASE_URL = "https://saloney.herokuapp.com";

  static Future customerSignup() {}
  /*

    {
    "errors": [
        "userName must be between 4 to 25 characters long"
    ]
}

   */
  static Future<HttpResponse> salonSignup() async {
    try {
      http.Response response = await http.post("$BASE_URL/register/salon");
      var result = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 201) {
        return HttpResponse(result['success'], result['message']);
      } else {
        return HttpResponse(false, result['errors'][0]);
      }
    } catch (e) {
      throw e;
    }
  }
}

/*

{
    "success": true,
    "message": "OTP has been sent to your email for verification",
    "data": {
        "local": {
            "firstName": "Not set",
            "lastName": "Not set",
            "isActive": true,
            "isEmailVerified": false,
            "userRole": "ROL-SALON",
            "email": "Saloney.salon@gmail.com",
            "password": "$2a$10$TthgMW/DZd1YP5sBM0OInOIgSWyZguo503TWmB7XsC8rvGmP0eX9y",
            "phone": 907383777,
            "userName": "jdoe",
            "location": "ilorin",
            "nameOfSalon": "Geeky salon",
            "otp": 1496
        },
        "image": {
            "path": "https://res.cloudinary.com/saloney.png"
        },
        "_id": "5fc963106cf85b0004540f1c",
        "identifier": "Saloney.salon@gmail.com",
        "createdAt": "2020-12-03T22:13:36.326Z",
        "updatedAt": "2020-12-03T22:13:36.326Z",
        "__v": 0
    }
}

 */
