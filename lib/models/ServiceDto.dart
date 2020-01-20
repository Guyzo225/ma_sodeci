import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class ServiceDto extends ToJsonInterface {
  int idService;
  String libelleService;

  ServiceDto({
    this.idService,
    this.libelleService,
  });

  factory ServiceDto.fromJson(Map<String, dynamic> json) => ServiceDto(
    idService: json["idService"] == null ? null : json["idService"],
    libelleService: json["libelleService"] == null ? null : json["libelleService"],
  );

  Map<String, dynamic> toJson() => {
    "idService": idService == null ? null : idService,
    "libelleService": libelleService == null ? null : libelleService,
  };
}