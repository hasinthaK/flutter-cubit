import 'package:bloc_auth/constants.dart';
import 'package:bloc_auth/cubit/auth/auth_cubit.dart';
import 'package:bloc_auth/data/models/login_credentials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final LoginCredentials credentials = LoginCredentials();

  // FormField controllers
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    mobileNoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // inputField validators
  String mobileNoValidator(String value) {
    if (value.isEmpty || value.length != 12) return "Incorrect mobile no";

    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty || value.length < 8)
      return "Password must be 8 characters long!";

    return null;
  }

  Future<void> submitForm(context) async {
    if (!_formKey.currentState.validate()) {
      print("Form contains errors!");
      return;
    }

    //  create post data
    credentials.mobileNo = mobileNoController.text;
    credentials.password = passwordController.text;

    // Exec login event
    BlocProvider.of<AuthCubit>(context).login(credentials);

    _formKey.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              //  Navigate to profile screen if login success
              if (state is UserDataFetched) {
                Navigator.pushReplacementNamed(context, PROFILE_ROUTE);
              }
            },
            child: Container(
              alignment: Alignment.center,
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {

                  // if auth loading, show spinner
                  if (state is AuthLoading)
                    return Center(
                        child: SpinKitFadingCircle(
                        color: Colors.blue,
                        size: 25.0,
                      )
                    );

                  //else return the login-form itself
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          validator: mobileNoValidator,
                          decoration: InputDecoration(
                            labelText: "Mobile no",
                            hintText: "Ex: +94712345678",
                            focusColor: Colors.blue,
                          ),
                          controller: mobileNoController,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: passwordValidator,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Minimum 8 characters long",
                            focusColor: Colors.blue,
                          ),
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: 65.0,
                        ),
                        ElevatedButton(
                            onPressed: () => submitForm(context),
                            // style: ButtonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 22.0, color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
