class TokenResponse {
  String accessToken;
  String tokenType;
  int expiresIn;
  String userName;
  String issued;
  String expires;

  TokenResponse({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.userName,
    this.issued,
    this.expires,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
    accessToken: json["access_token"] == null ? null : json["access_token"],
    tokenType: json["token_type"] == null ? null : json["token_type"],
    expiresIn: json["expires_in"] == null ? null : json["expires_in"],
    userName: json["userName"] == null ? null : json["userName"],
    issued: json[".issued"] == null ? null : json[".issued"],
    expires: json[".expires"] == null ? null : json[".expires"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken == null ? null : accessToken,
    "token_type": tokenType == null ? null : tokenType,
    "expires_in": expiresIn == null ? null : expiresIn,
    "userName": userName == null ? null : userName,
    ".issued": issued == null ? null : issued,
    ".expires": expires == null ? null : expires,
  };
}