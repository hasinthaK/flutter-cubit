import 'package:bloc_auth/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BlocAuth(router: AppRouter()));
}

class BlocAuth extends StatelessWidget {

  //inject router
  final AppRouter router;

  BlocAuth({Key key, this.router}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}

