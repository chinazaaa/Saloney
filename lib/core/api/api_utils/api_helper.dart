import 'dart:io';

import 'package:http/http.dart' as api;

import 'network_exceptions.dart';
import 'response_handler.dart';

class API {
  //API client
  static var client = api.Client();

  Future get(String url, header) async {
    var responseJson;
    try {
      var res;

      if (header != null) {
        res = await client.get(url, headers: header);
      } else {
        res = await client.get(url);
      }
      responseJson = responseHandler(res);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }

    return responseJson;
  }

  Future post(String url, header, body) async {
    var responseJson;
    try {
      ///Log collected Info
      // print('url: $url \nheader: $header\nbody: $body');
      var res = await client.post(url, headers: header, body: body);

      //Check if data is received
      // print(res.body);

      responseJson = await responseHandler(res);

      //Check respose
      // print(responseJson.toString());
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }
    return responseJson;
  }

  Future put(String url, header, {body}) async {
    var responseJson;
    try {
      var res = await client.post(url, headers: header, body: body);
      responseJson = responseHandler(res);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }
    return responseJson;
  }

  Future delete(String url, header) async {
    var responseJson;
    try {
      var res = await client.delete(url, headers: header);
      responseJson = responseHandler(res);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }
    return responseJson;
  }
}
