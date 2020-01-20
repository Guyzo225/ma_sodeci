class Status {
  final String message;
  final String code;

  Status({this.message,this.code});
  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      message: json['message'] ?? null,
      code: json['code'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return
      {
        'message': this.message,
        'code': this.code,
      };
  }
}