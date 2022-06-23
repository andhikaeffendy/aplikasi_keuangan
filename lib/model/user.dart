class User {
  int? id;
  String? email;
  String? name;
  String? photo;
  String? phoneNumber;
  String? idToken;

  User({this.id, this.email, this.idToken, this.name, this.photo, this.phoneNumber});

  User.fromJson(Map<String, dynamic> json)
      : id = json.containsKey("id") ? json["id"] : null,
        email = json.containsKey("email") ? json["email"] : null,
        idToken = json.containsKey("id_token") ? json["id_token"] : null,
        phoneNumber = json.containsKey("phone_number") ? json["phone_number"] : null,
        photo = json.containsKey("profile") ? json["profile"] : null,
        name = json.containsKey("name") ? json["name"] : null;

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "id_token": idToken,
        "name": name,
        "profile": photo,
        "phone_number": phoneNumber
      };

  // @override
  // String toString() {
  //   return "$email + $id + $idToken";
  // }
}
