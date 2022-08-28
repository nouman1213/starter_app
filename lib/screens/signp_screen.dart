// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/app_model/user_register.dart';
import 'package:starter_app/components/text_style.dart';
import 'package:starter_app/utils/routes/routes_name.dart';
import 'package:starter_app/utils/utils.dart';

import '../app_provider/auth/auth_provider.dart';
import '../components/round_button.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key, required this.data}) : super(key: key);
  dynamic data;

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authPro = Provider.of<AuthProvider>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data['name']),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email)),
              onFieldSubmitted: (valu) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(_obsecurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility)),
                    ),
                  );
                }),
            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: 'SignUp',
              loading: authPro.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'Please enter 6 digit password', context);
                } else {
                  // Map bodyData = {
                  //   'email': _emailController.text.toString(),
                  //   'password': _passwordController.text.toString(),
                  // };
                  Map bodyData = {
                    'email': 'eve.holt@reqres.in',
                    'password': 'pistol',
                  };

                  authPro.registerUserApi(bodyData, context);
                  print('api hit');
                }
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child:
                    headingText(text: 'Already have sccount? Login', size: 20))
          ],
        ),
      ),
    );
  }
}
