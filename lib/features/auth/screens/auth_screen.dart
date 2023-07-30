import 'package:apps/constants/global_variables.dart';
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
  GlobalKey signInFormKey = GlobalKey<FormState>();
  GlobalKey signUpFormKey = GlobalKey<FormState>();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController!.dispose();
    emailController!.dispose();
    passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
    );
  }

  SizedBox _buildBtn(
      {required void Function()? onPressed, required String data}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: GlobalVariables.secondaryColor,
        ),
        child: Text(data,
            style: const TextStyle(
              color: GlobalVariables.backgroundColor,
            )),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Form(
      key: signInFormKey,
      child: Column(
        children: [
          _buildTextField(controller: nameController, hintText: "Name"),
          const SizedBox(height: 16),
          _buildTextField(controller: emailController, hintText: "Email"),
          const SizedBox(height: 16),
          _buildTextField(controller: passwordController, hintText: "Password"),
          const SizedBox(height: 24),
          _buildBtn(onPressed: () {}, data: "Sign Up"),
        ],
      ),
    );
  }

  TextFormField _buildTextField(
      {required TextEditingController? controller, required String? hintText}) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38)),
        hintText: hintText,
      ),
    );
  }

  Widget _buildSignInForm() {
    return Form(
      key: signUpFormKey,
      child: Column(
        children: [
          _buildTextField(controller: emailController, hintText: "Email"),
          const SizedBox(height: 16),
          _buildTextField(controller: passwordController, hintText: "Password"),
          const SizedBox(height: 24),
          _buildBtn(onPressed: () {}, data: "Sign In"),
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
