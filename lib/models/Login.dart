import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class Login extends ToJsonInterface {
  String contact;
  String createdAt;
  int createdBy;
  int id;
  bool isDeleted;
  bool isSuperAdmin;
  String code;
  String matricule;
  String nom;
  String prenom;
  String typeUserCode;
  int typeUserId;
  String typeUserLibelle;
  String password;
  int Valeur;
  int Id_Usr;


  Login({
    this.contact,
    this.createdAt,
    this.createdBy,
    this.id,
    this.isDeleted,
    this.isSuperAdmin,
    this.code,
    this.matricule,
    this.nom,
    this.prenom,
    this.typeUserCode,
    this.typeUserId,
    this.typeUserLibelle,
    this.password,
    this.Valeur,
    this.Id_Usr
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    contact: json["contact"] == null ? null : json["contact"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    id: json["id"] == null ? null : json["id"],
    isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
    isSuperAdmin: json["isSuperAdmin"] == null ? null : json["isSuperAdmin"],
    code: json["code"] == null ? null : json["code"],
    matricule: json["matricule"] == null ? null : json["matricule"],
    nom: json["nom"] == null ? null : json["nom"],
    prenom: json["prenom"] == null ? null : json["prenom"],
    typeUserCode: json["typeUserCode"] == null ? null : json["typeUserCode"],
    typeUserId: json["typeUserId"] == null ? null : json["typeUserId"],
    typeUserLibelle: json["typeUserLibelle"] == null ? null : json["typeUserLibelle"],
    password: json["password"] == null ? null : json["password"],
    Valeur: json["Valeur"] == null ? null : json["Valeur"],
    Id_Usr: json["Id_Usr"] == null ? null : json["Id_Usr"],
  );

  Map<String, dynamic> toJson() => {
    "contact": contact == null ? null : contact,
    "createdAt": createdAt == null ? null : createdAt,
    "createdBy": createdBy == null ? null : createdBy,
    "id": id == null ? null : id,
    "isDeleted": isDeleted == null ? null : isDeleted,
    "isSuperAdmin": isSuperAdmin == null ? null : isSuperAdmin,
    "code": code == null ? null : code,
    "matricule": matricule == null ? null : matricule,
    "nom": nom == null ? null : nom,
    "prenom": prenom == null ? null : prenom,
    "typeUserCode": typeUserCode == null ? null : typeUserCode,
    "typeUserId": typeUserId == null ? null : typeUserId,
    "typeUserLibelle": typeUserLibelle == null ? null : typeUserLibelle,
    "password": password == null ? null : password,
    "Valeur": Valeur == null ? null : Valeur,
    "Id_Usr": Id_Usr == null ? null : Id_Usr,
  };
}