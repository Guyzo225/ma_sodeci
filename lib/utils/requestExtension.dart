import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sodeci_mobile/models/EagenceResponse.dart';
import '../models/data_response.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RequestExtension<T> {
  //static RequestExtension _instance = new RequestExtension();

  //factory RequestExtension() => _instance;
  static const String _urlEndpointV1 =
      'https://sodeci-api.smile.ci:8080/SODECI-Mobile/sodeci_mobile/e203c522baac970c592c944de7ee69a8d12003cf/ef97bc103c2825015a96f88c3d87ce8b68f73151/';
  static const String _urlEndpointE_Agence =
      'https://sodeci-api.smile.ci:8080/SODECI-Mobile/sodeci_mobile/e203c522baac970c592c944de7ee69a8d12003cf/ef97bc103c2825015a96f88c3d87ce8b68f73151/';
  static const String _urlEndpointV2 = "http://10.108.34.82:8082/api/";

  //static const  String _urlEndpoint = 'http://172.20.10.3:8080/';
  //static const  String _urlEndpoint = 'http://127.0.0.1:8080/';

  Future<dynamic> post(String url, dynamic data, bool isV1) async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    /*String baseUrl = "";
    baseUrl = await Utils.getData(AppConstant.URL_LINK);
    baseUrl = "http://" + baseUrl+ "/";*/
    final urlEnd = isV1 ? _urlEndpointV1 : _urlEndpointE_Agence;
    final response = await http.post(urlEnd + url,
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: data);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      debugPrint(response.body.toString());
      return DataResponse<T>.fromJson(json.decode(response.body.toString()));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post ' + response.reasonPhrase);
    }
  }

  Future<dynamic> postByPassSSl(String url, dynamic data, bool isV1) async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    /*String baseUrl = "";
    baseUrl = await Utils.getData(AppConstant.URL_LINK);
    baseUrl = "http://" + baseUrl+ "/";*/
    final urlEnd = isV1 ? _urlEndpointV1 : _urlEndpointE_Agence;

    HttpClientRequest request = await client.postUrl(Uri.parse(urlEnd+url));

    print(urlEnd+url);

    request.headers.set('content-type', 'application/json');

    request.add(utf8.encode(json.encode(data)));

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      debugPrint(reply);
      return DataResponse<T>.fromJson(json.decode(reply));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post ' + response.reasonPhrase);
    }
  }



  Future<dynamic> postWithNatif(String url, dynamic data, bool isV1) async {
    final urlEnd = isV1 ? _urlEndpointV1 : _urlEndpointE_Agence;
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request =
        await httpClient.postUrl(Uri.parse(urlEnd + url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(data));
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String reply = await response.transform(utf8.decoder).join();
      debugPrint('yyyyyyyyyy ' + reply);
      httpClient.close();
      return DataResponse<T>.fromJson(json.decode(reply));
    } else {
      debugPrint(response.statusCode.toString());
      // If that call was not successful, throw an error.
      throw Exception(response.reasonPhrase);
    }

    //return reply;
  }

  Future<dynamic> postWithDio(String url, FormData data) async {
    //final urlEnd = isV1 ? _urlEndpointV1 : _urlEndpointE_Agence;
    Dio dio = new Dio();

    Response response;
    response = await dio.post(url,
        data: data,
        options: Options(
          method: 'POST',
          responseType: ResponseType.json, // or ResponseType.JSON
        ));
    //request.headers.set('content-type', 'application/json');
    //request.add(utf8.encode(data));

    if (response.statusCode == 200) {
      debugPrint(response.data.toString());
      print(response.data);
      //print(json.decode(response.data));
      print("from dio");
      return DataResponse<T>.fromJson(response.data);
    } else {
      print(response);
      debugPrint(response.statusCode.toString());
      // If that call was not successful, throw an error.
      throw Exception(response.statusMessage);
    }
  }

  Future<dynamic> postWithDioInscription(String url, FormData data) async {
    //final urlEnd = isV1 ? _urlEndpointV1 : _urlEndpointE_Agence;
    Dio dio = new Dio();
    Response response;
    response = await dio.post(url,
        data: data,
        options: Options(
          method: 'POST',
          responseType: ResponseType.json, // or ResponseType.JSON
        ));
    //request.headers.set('content-type', 'application/json');
    //request.add(utf8.encode(data));

    if (response.statusCode == 200) {
      debugPrint(response.data.toString());
      print(response.data);
      //print(json.decode(response.data));
      print("from dio");
      return EagenceResponse.fromJson(jsonDecode(response.data.toString()));
    } else {
      print(response);
      debugPrint(response.statusCode.toString());
      // If that call was not successful, throw an error.
      throw Exception(response.statusMessage);
    }
  }

  Future<dynamic> get(String url, bool isV1) async {
    final urlEnd = isV1 ? _urlEndpointV1 : _urlEndpointV2;
    final response = await http
        .get(url, headers: {"Content-Type": "application/json; charset=utf-8"});
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      debugPrint(response.body.toString());
      return DataResponse<T>.fromJson(json.decode(response.body.toString()));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post ' + response.reasonPhrase);
    }
  }


  Future<dynamic> getNew(String url) async {
    //final urlEnd = _urlEndpointV2;
    final response = await http.get(_urlEndpointV2 + url,
        headers: {"Content-Type": "application/json; charset=utf-8"});
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      debugPrint(response.body.toString());
      return DataResponse<T>.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post ' + response.reasonPhrase);
    }
  }

  Future<dynamic> getToken(String url) async {
    //final urlEnd = _urlEndpointV2;
    Map<String, dynamic> body = {'grant_type': 'password', 'password': 'agpay-ci','username':'300'};
    final response = await http.post(url,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},body: body);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      debugPrint(response.body.toString());
      return DataResponse<T>.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post ' + response.reasonPhrase);
    }
  }
}
