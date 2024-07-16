import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mind_glow/core/Auth_service.dart';
import 'package:mind_glow/core/widgets/validation/validators.dart';
import 'package:mind_glow/presentaion/view/SettingsScreen.dart';

import '../../main.dart';
import '../../presentaion/view/LoginScreen.dart';

class GlobalWidgets {
  static void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        message,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showAlert({
    required BuildContext context,
    required String title,
    required String content,
    required String actionButtonText,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                },
                child: Text(actionButtonText),
              )
            ],
          );
        });
  }

  static navigateToNextScreen({
    required BuildContext context,
    required Widget widget,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static navigatePushToNextScreen({
    required BuildContext context,
    required Widget widget,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static Widget CustomButton(
      {required Function()? pressed, required String buttonText}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
      ),
      onPressed: pressed,
      child: SizedBox(
          width: MediaQuery.of(navigatorKey!.currentContext!).size.width,
          child: Center(child: Text(buttonText))),
    );
  }

  static PreferredSizeWidget appBar(
      {required String title, List<Widget>? actions}) {
    return AppBar(
      elevation: 0.1,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      actions: actions,
    );
  }
}

textWidget(
    {required String title,
    FontWeight fontWeight = FontWeight.w700,
    double fontSize = 28.0,
    TextDecoration textDecoration = TextDecoration.none,
    int maxLines = 1,
    required Color color}) {
  return Text(
    maxLines: maxLines,
    title,
    textAlign: TextAlign.center,
    style: TextStyle(
      decoration: textDecoration,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

textFormField(TextEditingController controller, String label,
    {bool isPassword = false}) {
  return TextFormField(
    controller: controller,
    style: const TextStyle(
      fontSize: 16.0,
    ),
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      fillColor: Colors.purple.withOpacity(0.1),
      filled: true,
      hintText: label,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
      hintStyle: const TextStyle(
        fontSize: 14.0,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.purple, width: 1.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      prefixIcon: Icon(
        isPassword ? Iconsax.key : Iconsax.shop,
        size: 18,
      ),
    ),
    validator: (value) {
      String? validationResult =
          UserValidation().validateInputPassword(value, label, false);
      return validationResult;
    },
  );
}

textFormFieldWithPassword(
    BuildContext context,
    String label,
    bool isPassword,
    bool isPasswordVisible,
    TextEditingController passwordController,
    TextEditingController emailController) {
  return TextFormField(
    controller: isPassword ? passwordController : emailController,
    style: const TextStyle(fontSize: 16.0),
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
      fillColor: Colors.purple.withOpacity(0.1),
      filled: true,
      hintText: label,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
      hintStyle: const TextStyle(fontSize: 14.0),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.purple, width: 1.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      prefixIcon: Icon(isPassword ? Iconsax.key : Iconsax.user, size: 18),
    ),
    validator: (value) {
      String? validationResult =
          UserValidation().validateInputPassword(value, label, false);
      return validationResult;
    },
  );
}

Widget customButton(
    {required String text,
    required VoidCallback onPressed,
    required double width}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16),
      foregroundColor: Colors.white,
      backgroundColor: Colors.purple,
    ),
    child: SizedBox(
      width: width,
      child: Center(
        child: textWidget(fontSize: 18, title: text, color: Colors.white),
      ),
    ),
  );
}

PreferredSizeWidget appBarAndBackButton(
    String title, BuildContext context, bool showBackButton, bool logout) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: textWidget(
            title: title,
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600),
      ),
    ),
    automaticallyImplyLeading: false,
    backgroundColor: Colors.purple.shade500,
    elevation: 10,
    // forceMaterialTransparency: true,
    leadingWidth: 40,
    // leading: Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: IconButton(
    //     icon: const Icon(
    //       Icons.arrow_back,
    //       color: Colors.white,
    //     ),
    //     onPressed: () {
    //       !showBackButton
    //           ? Navigator.pop(context)
    //           : Null;
    //     },
    //   ),
    // ),
    scrolledUnderElevation: 16,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    actions: [
      IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
             return  const SettingsScreen();
            },
          );
        },
        icon: Padding(
          padding: EdgeInsets.only(right: !logout ? 8.0 : 0.0),
          child: const Icon(Icons.settings_outlined, color: Colors.white),
        ),
      ),
      logout
          ? IconButton(
              onPressed: () {
                showAlertDialog(
                    context: context,
                    title: "Logout",
                    content: "Are you sure you want to logout?",
                    actionButtonText: "yes",
                    actionButtonText2: "No");
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
            )
          : const SizedBox()
    ],
  );
}

showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String actionButtonText,
  required String actionButtonText2,
}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                GlobalWidgets.navigatePushToNextScreen(
                    context: context, widget: LoginScreen(authService: AuthService()));
              },
              child: Text(actionButtonText),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(actionButtonText2),
            )
          ],
        );
      });
}
