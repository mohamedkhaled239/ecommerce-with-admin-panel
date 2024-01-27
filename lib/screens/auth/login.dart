import 'package:ecommerce2/consts/my_validator.dart';
import 'package:ecommerce2/screens/auth/forgot_password.dart';
import 'package:ecommerce2/screens/auth/google_button.dart';
import 'package:ecommerce2/screens/auth/register.dart';
import 'package:ecommerce2/widgets/app_name.dart';
import 'package:ecommerce2/widgets/subtitle_text.dart';
import 'package:ecommerce2/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class LoginScreen extends StatefulWidget {
  
  const LoginScreen({super.key});
  static const RoutName = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final _formKey = GlobalKey<FormState>();
  bool obscureText=true;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loginFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 56),
                const AppNameTextWidget(),
                const SizedBox(height: 10),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: TitlesTextWidget(label: "Welcome Back ")),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: 'Email address',
                            prefixIcon: Icon(IconlyLight.message)),
                        validator: (value) {
                          return MyValidators.emailValidator(value);
                        },
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_passwordFocusNode);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText:obscureText ,
                        decoration:  InputDecoration(
                          hintText: '********',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText=!obscureText;
                                });
                              },
                              icon: Icon(obscureText?
                                Icons.visibility:Icons.visibility_off,
                              ),),
                          prefixIcon: const  Icon(IconlyLight.lock),
                        ),
                        validator: (value) {
                          return MyValidators.passwordValidator(value);
                        },
                        onFieldSubmitted: (value) {
                          _loginFct();
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ForgotPasswordScreen.RoutName);
                          },
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: SubtitleTextWidget(
                              label: 'Forgot Password?',
                              textDecoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                            ),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                              backgroundColor: Colors.white70,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            _loginFct();
                          },
                          icon: const Icon(Icons.login, color: Colors.black),
                          label: const Text(
                            "Login",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SubtitleTextWidget(label: "or connect using".toUpperCase()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const GoogleButtom(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8),
                              backgroundColor: Colors.white70,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              _loginFct();
                            },
                            child: const Text(
                              "Guest",
                              style: TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SubtitleTextWidget(
                              label: "Don't have any account?"),
                          TextButton(
                              onPressed: () {

                                                          Navigator.pushNamed(context, RegisterScreen.RoutName);

                              }, child: const Text("Sign up")),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
