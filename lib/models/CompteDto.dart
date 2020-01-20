class CompteDto {
  String code;
  String createdAt;
  int id;
  bool isDeleted;
  String numero;
  double solde;
  int userId;
  String userLogin;
  String userNom;
  String userPrenom;
  String userCode;

  CompteDto({
    this.code,
    this.createdAt,
    this.id,
    this.isDeleted,
    this.numero,
    this.solde,
    this.userId,
    this.userLogin,
    this.userNom,
    this.userPrenom,
    this.userCode
  });

  factory CompteDto.fromJson(Map<String, dynamic> json) => CompteDto(
    code: json["code"] == null ? null : json["code"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    id: json["id"] == null ? null : json["id"],
    isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
    numero: json["numero"] == null ? null : json["numero"],
    solde: json["solde"] == null ? null : json["solde"],
    userId: json["userId"] == null ? null : json["userId"],
    userLogin: json["userLogin"] == null ? null : json["userLogin"],
    userNom: json["userNom"] == null ? null : json["userNom"],
    userPrenom: json["userPrenom"] == null ? null : json["userPrenom"],
    userCode: json["userCode"] == null ? null : json["userCode"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "createdAt": createdAt == null ? null : createdAt,
    "id": id == null ? null : id,
    "isDeleted": isDeleted == null ? null : isDeleted,
    "numero": numero == null ? null : numero,
    "solde": solde == null ? null : solde,
    "userId": userId == null ? null : userId,
    "userLogin": userLogin == null ? null : userLogin,
    "userNom": userNom == null ? null : userNom,
    "userCode": userCode == null ? null : userCode,
  };
}