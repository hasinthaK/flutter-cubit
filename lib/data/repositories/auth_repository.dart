
import 'package:bloc_auth/data/models/login_credentials.dart';
import 'package:bloc_auth/data/models/user_data.dart';
import 'package:bloc_auth/data/models/user_profile.dart';
import 'package:bloc_auth/data/services/auth_service.dart';

class AuthRepository {

  final AuthService authService;

  // inject AuthService
  AuthRepository({this.authService});

  /// Get full User Profile
  Future<UserProfile> getUser(int id, String token) async {
    dynamic userProfileRaw = await authService.getUser(id, token);
    return UserProfile.fromJson(userProfileRaw);
  }

  /// Returns basic userData with bearer token after successful login
  Future<UserData> login(LoginCredentials credentials) async {
    return await authService.login(credentials);
  }

}