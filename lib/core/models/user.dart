class User {
  String id;
  String name;
  String email;
  String token;

  User({this.id, this.name, this.email, this.token});

  User.initial()
      : id = '',
        name = '',
        email = '',
        token = '';

  User.fromJson(Map<String, dynamic> json)
      : assert(json['token'] != null),
        assert(json['user']['name'] != null),
        assert(json['user']['email'] != null),
        assert(json['user']['_id'] != null) {
    id = json['user']['_id'];
    name = json['user']['name'];
    email = json['user']['email'];
    token = json['token'];
  }

  User.fromPreference(Map<String, dynamic> json)
      : assert(json['token'] != null),
        assert(json['name'] != null),
        assert(json['email'] != null),
        assert(json['id'] != null) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['token'] = this.token;

    return data;
  }

  @override
  String toString() {
    return 'User: ${toJson()}';
  }
}
