class User {
  int? id;
  String? email;
  String? idToken;

  User({this.id, this.email, this.idToken});

  User.fromJson(Map<String, dynamic> json)
      : id = json.containsKey("id") ? json["id"] : null,
        email = json.containsKey("email") ? json["email"] : null,
        idToken = json.containsKey("id_token") ? json["id_token"] : null;

  Map<String, dynamic> toJson() =>
      {"id": id, "email": email, "id_token": idToken};

  // @override
  // String toString() {
  //   return "$email + $id + $idToken";
  // }
}
