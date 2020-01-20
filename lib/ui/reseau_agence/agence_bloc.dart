import 'dart:async';
import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:sodeci_mobile/models/DataAgence.dart';
import 'package:sodeci_mobile/models/data_response.dart';
import 'package:sodeci_mobile/utils/requestExtension.dart';
import 'package:location/location.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';

class AgenceBloc {

  Stream<bool> get loading => _loadingSubject.stream;
  final _loadingSubject = BehaviorSubject<bool>();

  Stream<List<DataAgence>> get agences => _agencesSubject.stream;
  final _agencesSubject = BehaviorSubject<List<DataAgence>>();


  Stream<LatLng> get currenPosition => _currenPositionStream.stream;
  final _currenPositionStream = BehaviorSubject<LatLng>();
  BehaviorSubject<LatLng> get currentPositionStream => _currenPositionStream;

  List<DataAgence> savedList = [];

  StreamSubscription<LocationData> listener;

  AgenceBloc() {
    _loadingSubject.add(false);
    _currenPositionStream.add(new LatLng(5.3899382, -3.9908012));
    var location = new Location();

      listener =   location.onLocationChanged().listen((LocationData currentLocation) {
      _currenPositionStream.add(new LatLng(currentLocation.latitude,currentLocation.longitude));
      filterList();
      print(currentLocation.latitude);
      print(currentLocation.longitude);
    });
    //getCurrentLocation();
  }

  void search(String q){
    if(q.isEmpty || q.trim().isEmpty){
      _agencesSubject.add(savedList);
    }else {
      List<DataAgence> filtered = [];
      savedList.forEach((f) {
        if(f.libelle.toLowerCase().contains(q.toLowerCase())){
          filtered.add(f);
        }
      });

      _agencesSubject.add(filtered);
    }
  }

  void getCurrentLocation() {
    try {
      Location().getLocation().then((value) {
        print("xxxxxxxxxxxx");
        print(value.latitude);
        print(value.longitude);
        _currenPositionStream.add(new LatLng(value.latitude, value.longitude));
        getAgence();
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {

      }
      _currenPositionStream.add(null);
    }
  }

  Future<void> getAgence() {
    _loadingSubject.add(true);
    RequestExtension<DataAgence> _rext = RequestExtension();

    DataAgence data = new DataAgence();

    Future response = _rext.postWithNatif(
        'agence/getByCriteria',jsonEncode(data),true);
    response.then((resp) {
      _loadingSubject.add(false);
      DataResponse<DataAgence> dataAgences = resp as DataResponse<DataAgence>;
      if (dataAgences.hasError == true) {
        _agencesSubject.add([]);
      } else {
        print("get Some data");
        final Distance distance = new Distance();
       dataAgences.itemsAgences.sort((a,b) =>
          distance(new LatLng(a.latitude, a.longitude),_currenPositionStream.value).compareTo(distance(new LatLng(b.latitude, b.longitude),_currenPositionStream.value))
        );
       print(dataAgences.itemsAgences);
        _agencesSubject.add(dataAgences.itemsAgences);
        savedList = dataAgences.itemsAgences;
      }
    });
  }

  void filterList(){
    final Distance distance = new Distance();
    savedList.sort((a,b) =>
        distance(new LatLng(a.latitude, a.longitude),_currenPositionStream.value).compareTo(distance(new LatLng(b.latitude, b.longitude),_currenPositionStream.value))
    );
    _agencesSubject.add(savedList);

  }

  void stopListening(){
    listener.cancel();
  }
}