import 'constants/global_variables.dart';
import 'features/auth/screens/auth_screen.dart';
import 'common/widgets/bottom_bar_screen.dart';
import 'provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './features/auth/services/auth_service.dart';
import './features/admin/screen/admin_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AuthService.getUserData(context: context);
    var userProvider = Provider.of<UserProvider>(context, listen: false);

    // userProvider.setUser(
    // r'{"_id":"64cbd77826b4cca75edcc2c7","name":"Fatma3","email":"Fatma3765@gmail.com","password":"$2a$08$TvQzL2O1gOkqHwfuRnTi5.LoCNEAOAWBYi5UJ9K3EvfJqBroPz5Se","address":"","type":"user","createdAt":"2023-08-03T16:36:08.162Z","updatedAt":"2023-08-03T16:36:08.162Z","__v":0,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0Y2JkNzc4MjZiNGNjYTc1ZWRjYzJjNyIsImlhdCI6MTY5MTMwODkwOX0.PFmLMqZEkzMvFOJWRP46eAWGc8uVZ3QkK26m5osxV5M"}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Amazon_Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          useMaterial3: true, // can remove this line
        ),
        // onGenerateRoute: (settings) => generateRoute(settings), mohamed
        home:
            // TestScreen()
            // Provider.of<UserProvider>(context).user.token.isEmpty
            // ? const AuthScreen()
            // : Provider.of<UserProvider>(context).user.type == 'user'?
            // const BottomBar():
            const AdminScreen());
  }
}
