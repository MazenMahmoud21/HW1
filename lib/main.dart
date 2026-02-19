import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/register_screen.dart';
import 'features/auth/screens/otp_screen.dart';
import 'features/home/screens/home_screen.dart';
import 'features/menu/screens/menu_screen.dart';

void main() {
  runApp(const BunyanApp());
}

class BunyanApp extends StatelessWidget {
  const BunyanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bunyan',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      locale: const Locale('ar', 'SA'),
      supportedLocales: const [
        Locale('ar', 'SA'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/menu': (context) => const MenuScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/otp') {
          final args = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (context) => OtpScreen(phoneNumber: args ?? ''),
          );
        }
        return null;
      },
    );
  }
}
