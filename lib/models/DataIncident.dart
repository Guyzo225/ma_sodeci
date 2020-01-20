import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class DataIncident extends ToJsonInterface{
  String lieuxIncident;
  String descriptionIncident;
  bool operationnel;
  String heureIncident;
  String photo;
  String dateIncident;
  String titreIncident;
  String contacts;

  DataIncident({
    this.lieuxIncident,
    this.descriptionIncident,
    this.operationnel,
    this.heureIncident,
    this.photo,
    this.dateIncident,
    this.titreIncident,
    this.contacts,
  });

  factory DataIncident.fromJson(Map<String, dynamic> json) => DataIncident(
    lieuxIncident: json["lieuxIncident"] == null ? null : json["lieuxIncident"],
    descriptionIncident: json["descriptionIncident"] == null ? null : json["descriptionIncident"],
    operationnel: json["operationnel"] == null ? null : json["operationnel"],
    heureIncident: json["heureIncident"] == null ? null : json["heureIncident"],
    photo: json["photo"] == null ? null : json["photo"],
    dateIncident: json["dateIncident"] == null ? null : json["dateIncident"],
    titreIncident: json["titreIncident"] == null ? null : json["titreIncident"],
    contacts: json["contacts"] == null ? null : json["contacts"],
  );

  Map<String, dynamic> toJson() => {
    "lieuxIncident": lieuxIncident == null ? null : lieuxIncident,
    "descriptionIncident": descriptionIncident == null ? null : descriptionIncident,
    "operationnel": operationnel == null ? null : operationnel,
    "heureIncident": heureIncident == null ? null : heureIncident,
    "photo": photo == null ? null : photo,
    "dateIncident": dateIncident == null ? null : dateIncident,
    "titreIncident": titreIncident == null ? null : titreIncident,
    "contacts": contacts == null ? null : contacts,
  };
}