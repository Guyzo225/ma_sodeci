import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class UrlPayement extends ToJsonInterface {
  String code;
  String description;
  String url;

  UrlPayement({
    this.code,
    this.description,
    this.url,
  });

  factory UrlPayement.fromJson(Map<String, dynamic> json) => UrlPayement(
    code: json["code"] == null ? null : json["code"],
    description: json["description"] == null ? null : json["description"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "description": description == null ? null : description,
    "url": url == null ? null : url,
  };
}