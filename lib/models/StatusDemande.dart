import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class StatusDemande extends ToJsonInterface {
  int codeTraitement;
  String messageTraitement;
  bool statutDemande;

  StatusDemande({
    this.codeTraitement,
    this.messageTraitement,
    this.statutDemande,
  });

  factory StatusDemande.fromJson(Map<String, dynamic> json) => StatusDemande(
    codeTraitement: json["CodeTraitement"] == null ? null : json["CodeTraitement"],
    messageTraitement: json["MessageTraitement"] == null ? null : json["MessageTraitement"],
    statutDemande: json["StatutDemande"] == null ? null : json["StatutDemande"],
  );

  Map<String, dynamic> toJson() => {
    "CodeTraitement": codeTraitement == null ? null : codeTraitement,
    "MessageTraitement": messageTraitement == null ? null : messageTraitement,
    "StatutDemande": statutDemande == null ? null : statutDemande,
  };
}
