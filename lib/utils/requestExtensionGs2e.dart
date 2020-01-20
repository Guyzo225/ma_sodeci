import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/DernierIndex.dart';
import 'package:sodeci_mobile/models/EagenceResponse.dart';
import 'package:sodeci_mobile/models/IndicatifItem.dart';
import 'package:sodeci_mobile/models/RefContractResponse.dart';
import 'package:sodeci_mobile/models/StatusDemande.dart';
import 'package:sodeci_mobile/models/TokenResponse.dart';
import 'package:sodeci_mobile/models/UrlPayement.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Gs2EDemandebranchementabonnementbase.dart';
import 'package:sodeci_mobile/models/saphirV3/Gs2EDemandebranchementbases.dart';
import 'package:sodeci_mobile/models/saphirV3/ReferenceContractItems.dart';
import 'package:sodeci_mobile/models/saphirV3/Secteuractivitebases.dart';
import 'package:sodeci_mobile/models/saphirV3/TypeUsage.dart';
import 'package:sodeci_mobile/models/saphirV3/saphirv3_response.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import '../models/data_response.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class RequestExtensionGs2e<T> {
  //static RequestExtension _instance = new RequestExtension();

  //factory RequestExtension() => _instance;
  static const root_url_nmpf = "https://apinmpfea.sodeci.ci/SODECIEAGENCE_ApiNMPF/";
  //static const url_eagence = "http://51.105.208.46/eagence/";
  static const url_eagence = "https://eagencesodeci.westeurope.cloudapp.azure.com/";
  static const String _urlToken = "$root_url_nmpf/authentification";
  static const root_url_saphirV3 = "https://papi.sodeci.ci/apiSaphirV3_Sodeci_3/web/app.php/api/";
      //'https://sodeci-api.smile.ci:8080/SODECI-Mobile/sodeci_mobile/e203c522baac970c592c944de7ee69a8d12003cf/ef97bc103c2825015a96f88c3d87ce8b68f73151/';
  static const String _urlEndpointE_Agence =
      'https://sodeci-api.smile.ci:8080/SODECI-Mobile/sodeci_mobile/e203c522baac970c592c944de7ee69a8d12003cf/ef97bc103c2825015a96f88c3d87ce8b68f73151/';
  static const String _urlEndpointV2 = "http://10.108.34.82:8082/api/";

  //static const  String _urlEndpoint = 'http://172.20.10.3:8080/';
  //static const  String _urlEndpoint = 'http://127.0.0.1:8080/';

  /*Future<dynamic> getToken() async {
    //final urlEnd = _urlEndpointV2;
    //dio.options.contentType=  Headers.formUrlEncodedContentType;
    print(_urlToken);
    Map<String, String> body = {
      'grant_type': 'password',
      'password': 'agpay-ci',
      'username': '300'
    };
    final response = await http.post(_urlToken,
        body: jsonEncode(body),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8")
        );
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      debugPrint(response.body.toString());
      return TokenResponse.fromJson(
          jsonDecode(response.body.toString()));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post ' + response.reasonPhrase + ' ' + response.statusCode.toString());
    }
  }*/

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
      //debugPrint(response.data.toString());
      print(response.data.toString().length);
      if(response.data.toString().isNotEmpty && response.data.toString().length>3){
        print("from dio");
        print(json.decode(response.data));
        print("from dio");
        return EagenceResponse.fromJson(jsonDecode(response.data.toString()));
      }else {
        return new EagenceResponse(refIndividu: 0);
      }

    } else {
      print("myBad");
      print(response);
      debugPrint(response.statusCode.toString());
      // If that call was not successful, throw an error.
      throw Exception(response.statusMessage);
    }
  }


  Future<dynamic> sendDocs(String url, FormData data) async {
    //final urlEnd = isV1 ? _urlEndpointV1 : _urlEndpointE_Agence;
    var uri = Uri.parse("http://pub.dartlang.org/packages/create");
    var request = new http.MultipartRequest("POST", uri);
    request.fields['user'] = 'nweiz@google.com';
    request.files.add(new http.MultipartFile.fromString(
        'package',
        'build/package.tar.gz',
        ));
        var response = await request.send();

    if (response.statusCode == 200) {
      //debugPrint(response.data.toString());
      print(response.stream.bytesToString());
      //print(json.decode(response.data));
      print("from dio");
      //return EagenceResponse.fromJson(jsonDecode(response.data.toString()));
    } else {
      print("myBad");
      print(response);
      debugPrint(response.statusCode.toString());
      // If that call was not successful, throw an error.
      throw Exception(response.reasonPhrase);
    }
  }




  Future<dynamic> postWithEAgence(String url, FormData data) async {
    //final urlEnd = isV1 ? _urlEndpointV1 : _urlEndpointE_Agence;
    Dio dio = new Dio();
    print(url_eagence + url);
    Response response;
    response = await dio.post( url_eagence + url,
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
      switch (T) {
        case UrlPayement:
          return UrlPayement.fromJson(jsonDecode(response.data.toString()));
          break;
        case EagenceResponse:
          return EagenceResponse.fromJson(jsonDecode(response.data.toString()));
          break;
        default:
          return null;
      }
    } else {
      print(response);
      debugPrint(response.statusCode.toString());
      // If that call was not successful, throw an error.
      throw Exception(response.statusMessage);
    }
  }



  Future<dynamic> getWithToken(String url) async {
    try{
      String token = await Utils.getData(AppConstant.TOKEN_LINK);
      final response = await http
          .get( url, headers: {HttpHeaders.authorizationHeader: "Bearer $token"},);
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        debugPrint(response.body.toString());
        switch(T){
          case RefContractResponse:
            return RefContractResponse.fromJson(json.decode(response.body.toString()));
            break;
          case Contactbases:
            return Contactbases.fromJson(jsonDecode(response.body.toString()));
            break;
          case DernierIndex:
            return DernierIndex.fromJson(jsonDecode(response.body.toString()));
            break;
          default:
            return null;
        }

      } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post ' + response.reasonPhrase);
      }
    }catch(e){
      print(e);
      throw Exception('Erreur réseaux ');
    }

  }

  Future<dynamic> getSimple(String url) async {
    try{
      final response = await http
          .get( url,);
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        debugPrint(response.body.toString());
        switch(T){
          case RefContractResponse:
            return RefContractResponse.fromJson(json.decode(response.body.toString()));
            break;
          case Contactbases:
            return Contactbases.fromJson(jsonDecode(response.body.toString()));
            break;
          case DernierIndex:
            return DernierIndex.fromJson(jsonDecode(response.body.toString()));
            break;
          case EagenceResponse:
            return EagenceResponse.fromJson(jsonDecode(response.body.toString()));
            break;
          case Gs2EDemandebranchementbases:
            return Gs2EDemandebranchementbases.fromJson(jsonDecode(response.body.toString()));
            break;
          case StatusDemande:
            return StatusDemande.fromJson(jsonDecode(response.body.toString()));
            break;
          case TypeUsage:
            return TypeUsage.fromJson(jsonDecode(response.body.toString()));
            break;
          case Secteuractivitebases:
            return Secteuractivitebases.fromJson(jsonDecode(response.body.toString()));
            break;
          case Gs2EDemandebranchementabonnementbase:
            return Gs2EDemandebranchementabonnementbase.fromJson(jsonDecode(response.body.toString()));
            break;
          case ReferenceContractItems:
            return ReferenceContractItems.fromJson(jsonDecode(response.body.toString()));
            break;
          default:
            return null;
        }

      } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load GET ' + response.reasonPhrase);
      }
    }catch(e){
      print(e);
      throw Exception('Erreur réseaux ');
    }

  }

  Future<dynamic> getIndicatif(String url) async {
    try{
      final response = await http
          .get(url_eagence +url, headers: {"Content-Type": "application/json; charset=utf-8"},);
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        debugPrint(response.body.toString());
        switch(T){
          case RefContractResponse:
            return RefContractResponse.fromJson(json.decode(response.body.toString()));
            break;
          case Contactbases:
            return Contactbases.fromJson(jsonDecode(response.body.toString()));
            break;
          default:
            return null;
        }

      } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post ' + response.reasonPhrase);
      }
    }catch(e){
      throw Exception('Erreur réseaux ');
    }

  }


  Future<dynamic> getSaphirV3(String url) async {
    try{
      print(root_url_saphirV3 +url);
      final response = await http
          .get(root_url_saphirV3 +url, headers: {"Content-Type": "application/json; charset=utf-8"},);
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        debugPrint(response.body.toString());
        return SaphirV3Response<T>.fromJson(json.decode(response.body.toString()));
      } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post ' + response.reasonPhrase);
      }
    }catch(e){
      throw Exception('Erreur réseaux ');
    }

  }

  Future<dynamic> simulate(String url) async {
    try{
      print(root_url_saphirV3 +url);
      final response = await http
          .get(root_url_saphirV3 +url, headers: {"Content-Type": "application/json; charset=utf-8"},);
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        //debugPrint(response.body.toString());
        return response.body.toString();
      } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post ' + response.reasonPhrase);
      }
    }catch(e){
      throw Exception('Erreur réseaux ');
    }

  }

  Future<dynamic> getIndicatif2(String url, bool isV1) async {
    final response = await http
        .get(url, headers: {"Content-Type": "application/json; charset=utf-8"});
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      debugPrint(response.body.toString());
      return DataResponse<T>.fromJson(jsonDecode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post ' + response.reasonPhrase);
    }
  }


  Future<dynamic> getToken() async {
    //final urlEnd = _urlEndpointV2;
    Dio dio = new Dio();
    //dio.options.contentType=  Headers.formUrlEncodedContentType;
    Map<String, String> body = {
      "grant_type": "password",
      "password": "agpay-ci",
      "username": "300"
    };
    final response = await dio.post(_urlToken,
        data: body,
        options: Options(contentType: Headers.formUrlEncodedContentType)
        );
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      debugPrint(response.data.toString());
      return TokenResponse.fromJson(response.data);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post ' + response.statusMessage);
    }
  }
}
