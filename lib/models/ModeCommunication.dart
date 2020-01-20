class ModeCommunication {
  int id;
  String libelle;

  ModeCommunication({
    this.id,
    this.libelle,
  });

  factory ModeCommunication.fromJson(Map<String, dynamic> json) => ModeCommunication(
    id: json["id"] == null ? null : json["id"],
    libelle: json["libelle"] == null ? null : json["libelle"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "libelle": libelle == null ? null : libelle,
  };
}