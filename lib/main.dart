import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mind_glow/presentaion/view/HomePage.dart';
import 'package:mind_glow/presentaion/view/LoginScreen.dart';
import 'package:mind_glow/presentaion/view/communityView.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'core/Auth_service.dart';
import 'core/di/injectable.dart';
import 'domain/helpdesk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  final authService = AuthService();
  final bool loggedIn = await authService.isLoggedIn();
  var name = await authService.getUsername();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(HelpDeskAdapter())..registerAdapter(
      HelpDeskElementAdapter());
  configureDependencies();
  runApp(
    ChangeNotifierProvider(
      create: (context) => DiscussionProvider(),
      child: MyApp(authService, loggedIn, name),
    ),
  );
}

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final bool loggedIn;
  final AuthService authService;
  final String? name;

  const MyApp(this.authService, this.loggedIn, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mind-Glow',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: loggedIn
              ? FutureBuilder<String?>(
            future: authService.getUsername(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Scaffold(
                  body: Center(child: Text('Error: ${snapshot.error}')),
                );
              } else {
                final username = snapshot.data ?? 'User';
                return HomePage(
                    username);
              }
            },
          )
              : LoginScreen(authService: authService),

    ); }
}

