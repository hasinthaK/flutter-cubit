import 'dart:convert';
import 'package:bloc_auth/constants.dart';
import 'package:bloc_auth/data/models/login_credentials.dart';
import 'package:http/http.dart';

class AuthService {

  /// Returns basic userData with AccessToken
  Future<dynamic> login(LoginCredentials credentials) async {
    Response response = await get(Uri.parse('$API_BASE/users/login'));

    // only process success http responses otherwise return null
    if (response.statusCode > 399) return null;

    return jsonDecode(response.body);
  }

  /// get full user Profile
  Future<dynamic> getUser(int id, String token) async {
    Response response = await get(Uri.parse('$API_BASE/users/$id'),
        headers: {"Authorization": 'Bearer $token'});

    if (response.statusCode > 399) return null;

    return jsonDecode(response.body);
  }
}
