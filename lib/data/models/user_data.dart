
/// Basic userData with AuthToken
class UserData {
  int id;
  String name;
  String username;
  String email;
  String token;

  UserData({this.id, this.name, this.username, this.email, this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'];
    username = json['username'];
    email = json['email'];
    token = json['token'];
  }

}