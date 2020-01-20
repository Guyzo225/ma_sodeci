import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';
import 'package:sodeci_mobile/models/CiviliteItem.dart';
import 'package:sodeci_mobile/models/DataAgence.dart';
import 'package:sodeci_mobile/models/DataReflex.dart';
import 'package:sodeci_mobile/models/DataService.dart';
import 'package:sodeci_mobile/models/IndicatifItem.dart';
import 'package:sodeci_mobile/models/Login.dart';
import 'package:sodeci_mobile/models/Status.dart';
import 'package:sodeci_mobile/models/saphirV3/CategorieClientItem.dart';
import 'package:sodeci_mobile/models/saphirV3/Categoriecontractuelleclientbases.dart';
import 'package:sodeci_mobile/models/saphirV3/CommuneItem.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Contractbase.dart';
import 'package:sodeci_mobile/models/saphirV3/Conventionfacturationbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Gs2EBranchementbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Gs2EModeledecontratclientbases.dart';
import 'package:sodeci_mobile/models/saphirV3/Gs2ETypededocumentdumodelebases.dart';
import 'package:sodeci_mobile/models/saphirV3/Productbases.dart';
import 'package:sodeci_mobile/models/saphirV3/QuartierItem.dart';
import 'package:sodeci_mobile/models/saphirV3/Salesliteraturebases.dart';
import 'package:sodeci_mobile/models/saphirV3/gs2e_civilitebases.dart';

class SaphirV3Response<T> extends Object {
  String context;
  String id;
  String type;
  int totalItems;
  List<T> hydraMember;
  List<T> data;

  SaphirV3Response({
    this.context,
    this.id,
    this.type,
    this.hydraMember,
    this.totalItems,
    this.data
  });

  factory SaphirV3Response.fromJson(Map<String, dynamic> json) => SaphirV3Response(
    context: json["@context"] == null ? null : json["@context"],
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    totalItems: json["hydra:totalItems"] == null ? null : json["hydra:totalItems"],
    hydraMember: json["hydra:member"] == null ? [] :
    json["hydra:member"].map<T>((x) {
      switch (T) {
        case Contactbases:
          return Contactbases.fromJson(x) as T;
          break;
        case Civilitebases:
          return Civilitebases.fromJson(x) as T;
          break;
        case Contractbase:
          return Contractbase.fromJson(x) as T;
          break;
        case CommuneItem:
          return CommuneItem.fromJson(x) as T;
          break;
        case QuartierItem:
          return QuartierItem.fromJson(x) as T;
          break;
        case CategorieClientItem:
          return CategorieClientItem.fromJson(x) as T;
          break;
        case Productbases:
          return Productbases.fromJson(x) as T;
          break;
        case Gs2EModeledecontratclientbases:
          return Gs2EModeledecontratclientbases.fromJson(x) as T;
          break;
        case Gs2ETypededocumentdumodelebases:
          return Gs2ETypededocumentdumodelebases.fromJson(x) as T;
          break;
        case Salesliteraturebases:
          return Salesliteraturebases.fromJson(x) as T;
          break;
        case Categoriecontractuelleclientbases:
          return Categoriecontractuelleclientbases.fromJson(x) as T;
          break;
        case Gs2EBranchementbases:
          return Gs2EBranchementbases.fromJson(x) as T;
          break;
        default:
          return null;
      }
    }).toList(),
    data: json["data"] == null ? [] :
    json["data"].map<T>((x) {
      switch (T) {
        case Conventionfacturationbases:
          return Conventionfacturationbases.fromJson(x) as T;
          break;
        default:
          return null;
      }
    }).toList(),
  );

  Map<String, dynamic> toJson() => {
    "@context": context == null ? null : context,
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "hydra:totalItems": totalItems == null ? null : totalItems,
    "hydra:member": hydraMember == null ? null : new List<T>.from(hydraMember.map((x) => (x as ToJsonInterface).toJson())),
    "data": data == null ? null : new List<T>.from(data.map((x) => (x as ToJsonInterface).toJson())),
  };
}
