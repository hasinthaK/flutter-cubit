import 'package:bloc/bloc.dart';
import 'package:bloc_auth/data/models/login_credentials.dart';
import 'package:bloc_auth/data/models/user_data.dart';
import 'package:bloc_auth/data/models/user_profile.dart';
import 'package:bloc_auth/data/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  final AuthRepository authRepository;

  AuthCubit({this.authRepository}) : super(NoAuth());
  // TODO: Rehydrate the local app state from device local storage

  /// Login with credentials
  void login(LoginCredentials credentials) async {
    emit(AuthLoading());
    try {
      UserData userData = await authRepository.login(credentials);
      emit(UserDataFetched(userData: userData));
    } catch (e) {
      print(e);
      emit(AuthError());
    }
  }

  /// Get User Profile
  void getUser(int id, String token) async {
    emit(AuthLoading());
    try {
      UserProfile userProfile = await authRepository.getUser(id, token);
      emit(UserProfileFetched(userProfile: userProfile));
    } catch (e) {
      print(e);
      emit(AuthError());
    }
  }

  /// Logout user
  void logout() {
    emit(Logout());
  }



}
