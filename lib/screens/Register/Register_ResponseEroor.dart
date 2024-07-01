/// name : ["register with this name already exists."]

class RegisterResponseEroor {
  RegisterResponseEroor({
      this.name,});

  RegisterResponseEroor.fromJson(dynamic json) {
    name = json['name'] != null ? json['name'].cast<String>() : [];
  }
  List<String>? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }

}