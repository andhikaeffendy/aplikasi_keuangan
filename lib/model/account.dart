class Account {
  int? id;
  String? name;

  Account({this.id, this.name});

  Account.fromJson(Map<String, dynamic> json)
      : id = json.containsKey("id") ? json["id"] : null,
        name = json.containsKey("name") ? json["name"] : null;

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
