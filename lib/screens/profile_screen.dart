import 'package:bloc_auth/cubit/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _buildProfile(context, state)
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildProfile(context, state) {
    List<Widget> children = [
      Container(
        alignment: Alignment.topCenter,
        child: Text(
          "Profile screen",
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(height: 35.0,),
    ];

    if (state is AuthLoading) {
      children.add(
          SpinKitFadingCircle(
            color: Colors.blue,
            size: 25.0,
          ));
    }

    if (state is UserDataFetched) {
      children.addAll([
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Username"),
            Text("${state.userData.username}"),
          ],
        ),
        SizedBox(height: 50.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("email"),
            Text("${state.userData.email}"),
          ],
        ),
        SizedBox(height: 60.0,),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).logout();
              Navigator.pushReplacementNamed(context, "/");
            },
            child: Text("Logout")
        )
      ]);
    }

    return children;
  }
}
