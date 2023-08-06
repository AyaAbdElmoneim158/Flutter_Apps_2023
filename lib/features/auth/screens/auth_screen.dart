import '../../../common/widgets/custom_btn.dart';
import '../../../common/widgets/custom_textfield.dart';

import '../../../constants/global_variables.dart';
import '../services/auth_service.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

enum Auth { signIn, signUp }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final signInFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signupUser() {
    AuthService.signupUser(
        context: context,
        name: nameController.text,
        password: passwordController.text,
        email: emailController.text);
  }

  void signinUser() {
    AuthService.signinUser(
        context: context,
        password: passwordController.text,
        email: emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Text("Welcome", style: Theme.of(context).textTheme.headlineSmall),
              _buildRadioBtn(context,
                  title: "Create account", value: Auth.signUp),
              _buildRadioBtn(context, title: "SignIn", value: Auth.signIn),
              ConditionalBuilder(
                condition: _auth == Auth.signUp,
                builder: (context) => _buildSignUpForm(),
                fallback: (context) => _buildSignInForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Form(
      key: signUpFormKey,
      child: Column(
        children: [
          CustomTextfield(controller: nameController, hintText: "Name"),
          const SizedBox(height: 16),
          CustomTextfield(controller: emailController, hintText: "Email"),
          const SizedBox(height: 16),
          CustomTextfield(controller: passwordController, hintText: "Password"),
          const SizedBox(height: 24),
          CustomBtn(
            data: "Sign Up",
            onPressed: () {
              if (signUpFormKey.currentState!.validate()) {
                signupUser();
                debugPrint("signupUser");
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildSignInForm() {
    return Form(
      key: signInFormKey,
      child: Column(
        children: [
          CustomTextfield(controller: emailController, hintText: "Email"),
          const SizedBox(height: 16),
          CustomTextfield(controller: passwordController, hintText: "Password"),
          const SizedBox(height: 24),
          CustomBtn(
            data: "Sign In",
            onPressed: () {
              if (signInFormKey.currentState!.validate()) {
                signinUser();
              }
            },
          )
        ],
      ),
    );
  }

  ListTile _buildRadioBtn(BuildContext context,
      {required String title, required Auth value}) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      leading: Radio(
        value: value,
        groupValue: _auth,
        onChanged: (Auth? val) {
          setState(() {
            _auth = val!;
          });
        },
        activeColor: GlobalVariables.secondaryColor,
      ),
    );
  }
}
