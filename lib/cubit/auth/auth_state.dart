part of 'auth_cubit.dart';

@immutable
abstract class AuthState {
  final UserData userData;
  final UserProfile userProfile;

  AuthState({this.userData, this.userProfile});
}

class NoAuth extends AuthState {
  NoAuth() : super(userData: null, userProfile: null);
}

class UserDataFetched extends AuthState {
  final UserData userData;
  UserDataFetched({this.userData}) : super(userData: userData);
}

class UserProfileFetched extends AuthState {
  final UserProfile userProfile;
  UserProfileFetched({this.userProfile}) : super(userProfile: userProfile);
}

class AuthError extends AuthState {
  AuthError() : super(userData: null, userProfile: null);
}

class Logout extends AuthState {
  Logout(): super(userData: null, userProfile: null);
}

class AuthLoading extends AuthState {}