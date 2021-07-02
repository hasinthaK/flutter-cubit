import 'package:bloc_auth/constants.dart';
import 'package:bloc_auth/cubit/auth/auth_cubit.dart';
import 'package:bloc_auth/data/repositories/auth_repository.dart';
import 'package:bloc_auth/data/services/auth_service.dart';
import 'package:bloc_auth/screens/login_screen.dart';
import 'package:bloc_auth/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  AuthRepository _authRepository;
  AuthCubit _authCubit;

  AppRouter() {
    _authRepository = AuthRepository(authService: AuthService());
    _authCubit = AuthCubit(authRepository: _authRepository);
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(value: _authCubit, child: LoginScreen()),
        );
      case PROFILE_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _authCubit,
                  child: ProfileScreen()),
        );
      default:
        return null;
    }
  }
}
