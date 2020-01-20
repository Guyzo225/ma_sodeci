import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';
import 'package:sodeci_mobile/models/CiviliteItem.dart';
import 'package:sodeci_mobile/models/DataAgence.dart';
import 'package:sodeci_mobile/models/DataReflex.dart';
import 'package:sodeci_mobile/models/DataService.dart';
import 'package:sodeci_mobile/models/IndicatifItem.dart';
import 'package:sodeci_mobile/models/Login.dart';
import 'package:sodeci_mobile/models/Status.dart';

class DataResponse<T> extends Object {
  final Status status;
  final bool hasError;
  final int count;
  final List<T> items;
  final List<T> itemsBonReflexes;
  final List<T> itemsAgences;
  final List<T> itemsDetailCategorieService;
  final List<T> entity;
  final List<T> Tab_Indicatif;

  DataResponse(
      {this.status,
      this.hasError,
      this.count,
      this.items = const [],
      this.itemsBonReflexes = const [],
      this.itemsDetailCategorieService = const [],
      this.entity = const [],
      this.Tab_Indicatif = const [],
      this.itemsAgences = const[]});

  factory DataResponse.fromJson(Map<String, dynamic> json) {
    return DataResponse(
      status: json['status'] == null ? null : Status.fromJson(json['status']),
      hasError: json['hasError'],
      count: json['count'] == null ? null : int.parse(json['count'].toString()),
      items: json['items'] == null
          ? []
          : json["items"].map<T>((x) {
              switch (T) {
                case Login:
                  return Login.fromJson(x) as T;
                  break;
                case IndicatifItem:
                  return IndicatifItem.fromJson(x) as T;
                  break;
                case CiviliteItem:
                  return CiviliteItem.fromJson(x) as T;
                  break;
                default:
                  return null;
              }
            }).toList(),
      itemsAgences: json['itemsAgences'] == null
          ? []
          : json["itemsAgences"].map<T>((x) {
        switch (T) {
          case DataAgence:
            return DataAgence.fromJson(x) as T;
            break;
          default:
            return null;
        }
      }).toList(),
      itemsBonReflexes: json['itemsBonReflexes'] == null
          ? []
          : json["itemsBonReflexes"].map<T>((x) {
              switch (T) {
                case DataReflex:
                  return DataReflex.fromJson(x) as T;
                  break;
                default:
                  return null;
              }
            }).toList(),
      itemsDetailCategorieService: json['itemsDetailCategorieService'] == null
          ? []
          : json["itemsDetailCategorieService"].map<T>((x) {
              switch (T) {
                case DataService:
                  return DataService.fromJson(x) as T;
                  break;
                default:
                  return null;
              }
            }).toList(),
      entity: json['entity'] == null
          ? []
          : json["entity"].map<T>((x) {
              switch (T) {
                case DataAgence:
                  return DataAgence.fromJson(x) as T;
                  break;
                default:
                  return null;
              }
            }).toList(),
      Tab_Indicatif: json['Tab_Indicatif'] == null
          ? []
          : json["Tab_Indicatif"].map<T>((x) {
              switch (T) {
                case IndicatifItem:
                  return IndicatifItem.fromJson(x) as T;
                  break;
                default:
                  return null;
              }
            }).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hasError': this.hasError,
      'status': this.status.toJson(),
      'count': this.count ?? null,
      'items': this.items == null
          ? null
          : new List<T>.from(items.map((x) => (x as ToJsonInterface).toJson())),
      'itemsBonReflexes': this.items == null
          ? null
          : new List<T>.from(items.map((x) => (x as ToJsonInterface).toJson())),
      'itemsDetailCategorieService': this.items == null
          ? null
          : new List<T>.from(items.map((x) => (x as ToJsonInterface).toJson())),
      'entity': this.items == null
          ? null
          : new List<T>.from(items.map((x) => (x as ToJsonInterface).toJson())),
      'Tab_Indicatif': this.Tab_Indicatif == null
          ? null
          : new List<T>.from(
              Tab_Indicatif.map((x) => (x as ToJsonInterface).toJson())),
    };
  }
}
