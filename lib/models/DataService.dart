import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';
import 'package:sodeci_mobile/models/DatasDetailCategorieService.dart';
import 'package:sodeci_mobile/models/ServiceDto.dart';

class DataService extends ToJsonInterface {
  int idDetailService;
  String questionDetailService;
  String message;
  String urlShare;
  int idServiceDto;
  ServiceDto serviceDto;
  List<DatasDetailCategorieService> datasDetailCategorieService;

  DataService({
    this.idDetailService,
    this.questionDetailService,
    this.message,
    this.urlShare,
    this.idServiceDto,
    this.serviceDto,
    this.datasDetailCategorieService,
  });

  factory DataService.fromJson(Map<String, dynamic> json) => DataService(
    idDetailService: json["idDetailService"] == null ? null : json["idDetailService"],
    questionDetailService: json["questionDetailService"] == null ? null : json["questionDetailService"],
    message: json["message"] == null ? null : json["message"],
    urlShare: json["urlShare"] == null ? null : json["urlShare"],
    idServiceDto: json["idServiceDto"] == null ? null : json["idServiceDto"],
    serviceDto: json["serviceDto"] == null ? null : ServiceDto.fromJson(json["serviceDto"]),
    datasDetailCategorieService: json["datasDetailCategorieService"] == null ? null : List<DatasDetailCategorieService>.from(json["datasDetailCategorieService"].map((x) => DatasDetailCategorieService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idDetailService": idDetailService == null ? null : idDetailService,
    "questionDetailService": questionDetailService == null ? null : questionDetailService,
    "message": message == null ? null : message,
    "urlShare": urlShare == null ? null : urlShare,
    "idServiceDto": idServiceDto == null ? null : idServiceDto,
    "serviceDto": serviceDto == null ? null : serviceDto.toJson(),
    "datasDetailCategorieService": datasDetailCategorieService == null ? null : List<dynamic>.from(datasDetailCategorieService.map((x) => x.toJson())),
  };
}