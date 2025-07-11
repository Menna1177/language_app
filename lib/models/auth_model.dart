class AuthModel{
  String ?accesstoken;
  String ?refreshtoken;
  String? name;
  String? email;
  AuthModel(this.name, this.email,
      {
        required this.accesstoken,
        required this.refreshtoken
      });
  AuthModel.fromJson(Map<String,dynamic> json, {required String email, required String name})
  {
    accesstoken=json['access_token'];
    refreshtoken=json['refresh_token'];
    this.name = name;
    this.email = email;


  }
}