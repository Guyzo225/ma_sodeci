class TabEagence {
  int ref;
  String lib;

  TabEagence({
    this.ref,
    this.lib,
  });

  factory TabEagence.fromJson(Map<String, dynamic> json) => TabEagence(
    ref: json["Ref"] == null ? null : json["Ref"],
    lib: json["Lib"] == null ? null : json["Lib"],
  );

  Map<String, dynamic> toJson() => {
    "Ref": ref == null ? null : ref,
    "Lib": lib == null ? null : lib,
  };
}