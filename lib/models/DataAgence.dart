import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class DataAgence extends ToJsonInterface {
  String id;
  String libelle;
  String contact;
  String adresse;
  double longitude;
  double latitude;

  DataAgence({
    this.id,
    this.libelle,
    this.contact,
    this.adresse,
    this.longitude,
    this.latitude,
  });

  factory DataAgence.fromJson(Map<String, dynamic> json) => DataAgence(
    id: json["id"] == null ? null : json["id"],
    libelle: json["libelle"] == null ? null : json["libelle"],
    contact: json["contact"] == null ? null : json["contact"],
    adresse: json["adresse"] == null ? null : json["adresse"],
    longitude: json["longitude"] == null ? null : double.parse(json["longitude"]),
    latitude: json["latitude"] == null ? null : double.parse(json["latitude"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "libelle": libelle == null ? null : libelle,
    "contact": contact == null ? null : contact,
    "adresse": adresse == null ? null : adresse,
    "longitude": longitude == null ? null : longitude,
    "latitude": latitude == null ? null : latitude,
  };
}