import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Productbases extends ToJsonInterface {
  String id;
  String type;
  String name;
  int statuscode;
  String productid;
  dynamic transactioncurrencyid;

  Productbases({
    this.id,
    this.type,
    this.name,
    this.statuscode,
    this.productid,
    this.transactioncurrencyid,
  });

  factory Productbases.fromJson(Map<String, dynamic> json) => Productbases(
    id: json["@id"] == null ? null : json["@id"],
    type: json["@type"] == null ? null : json["@type"],
    name: json["name"] == null ? null : json["name"],
    statuscode: json["statuscode"] == null ? null : json["statuscode"],
    productid: json["productid"] == null ? null : json["productid"],
    transactioncurrencyid: json["transactioncurrencyid"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id == null ? null : id,
    "@type": type == null ? null : type,
    "name": name == null ? null : name,
    "statuscode": statuscode == null ? null : statuscode,
    "productid": productid == null ? null : productid,
    "transactioncurrencyid": transactioncurrencyid,
  };
}