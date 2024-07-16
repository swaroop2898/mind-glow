import 'package:flutter/material.dart';
import 'package:mind_glow/core/Auth_service.dart';
import 'package:mind_glow/presentaion/view/quizView.dart';

import '../../core/widgets/common_widgets.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isLoading = true;

  LoginScreen({super.key, required this.authService});
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (isExiting) {
        // This callback is required but does nothing in this case
      },
      child: Scaffold(
        appBar: appBarAndBackButton("Login", context, true, false),
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: buildCenteredScrollView(context, authService),
        ),
      ),
    );
  }

  Widget buildCenteredScrollView(
      BuildContext context, AuthService authService) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: buildLoginForm(context, authService)),
    );
  }

  Widget buildLoginForm(BuildContext context, AuthService authService) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildHeaderImage(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildHeaderText(context),
          ),
          textFormField(emailController, "UserName"),
          _buildTextFormField(context, "password", isPassword: true),
          buildForgotPasswordButton(context),
          buildCustomButton(context, isLoading, emailController, authService),
        ],
      ),
    );
  }

  Widget buildCustomButton(BuildContext context, bool isLoading,
      TextEditingController emailController, AuthService authService) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: !isLoading
            ? const CircularProgressIndicator()
            : customButton(
                text: "Login",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (emailController.text == "swaroop" &&
                        passwordController.text == "12345") {
                      GlobalWidgets.navigateToNextScreen(
                          context: context,
                          widget: QuizView(emailController.text));
                      await authService.setUsername(emailController.text);
                      await authService.setLoggedIn(true);
                    } else {
                      showAlertDialog(
                          context: context,
                          title: "Login",
                          content: "Invalid Credentials",
                          actionButtonText: "",
                          actionButtonText2: "okay");
                    }
                  }
                },
                width: MediaQuery.of(context).size.width));
  }

  Widget buildHeaderImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 8, left: 8, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Image.asset(
              "asset/img.png",
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeaderText(BuildContext context) {
    return textWidget(title: "Mind-Glow", color: Colors.purple);
  }

  Widget buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {},
        child: textWidget(
            textDecoration: TextDecoration.underline,
            title: "ForgotPassword",
            color: Colors.purple,
            fontSize: 14),
      ),
    );
  }

  Widget _buildTextFormField(BuildContext context, String label,
      {bool isPassword = false}) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: textFormFieldWithPassword(context, label, isPassword,
            isPasswordVisible, passwordController, emailController));
  }
}
