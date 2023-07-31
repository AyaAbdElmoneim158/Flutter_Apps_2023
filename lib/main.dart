import 'package:apps/features/admin/screen/admin_screen.dart';

import 'constants/global_variables.dart';
import 'constants/router.dart';
import 'features/auth/screens/auth_screen.dart';
import 'features/auth/services/auth_service.dart';
import 'common/widgets/bottom_bar_screen.dart';
import 'provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    //! AuthService.getUserData(context: context);
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
        onGenerateRoute: (settings) => generateRoute(settings),
        home:
            //  Provider.of<UserProvider>(context).user.token.isEmpty
            //     ? const AuthScreen()
            //     : Provider.of<UserProvider>(context).user.type == 'user'
            //         ? const BottomBar()
            //         :
            const AdminScreen());
  }
}
