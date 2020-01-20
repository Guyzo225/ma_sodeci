class Conseil {
  int idConseil;
  String conseil;
  String urlShare;
  dynamic statut;

  Conseil({
    this.idConseil,
    this.conseil,
    this.urlShare,
    this.statut,
  });

  factory Conseil.fromJson(Map<String, dynamic> json) => Conseil(
    idConseil: json["idConseil"] == null ? null : json["idConseil"],
    conseil: json["conseil"] == null ? null : json["conseil"],
    urlShare: json["urlShare"] == null ? null : json["urlShare"],
    statut: json["statut"],
  );

  Map<String, dynamic> toJson() => {
    "idConseil": idConseil == null ? null : idConseil,
    "conseil": conseil == null ? null : conseil,
    "urlShare": urlShare == null ? null : urlShare,
    "statut": statut,
  };
}