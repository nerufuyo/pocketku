import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pocketku/presentation/screens/home_screen.dart';
import 'package:pocketku/presentation/screens/notification_screen.dart';
import 'package:pocketku/presentation/screens/settings_screen.dart';
import 'package:pocketku/presentation/screens/transaction_screen.dart';
import 'package:pocketku/presentation/styles/pallet.dart';
import 'package:pocketku/presentation/styles/typography.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PocketKu',
      theme: ThemeData(
        useMaterial3: true,
        canvasColor: white,
      ),
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomeScreen.routeName:
            return MaterialPageRoute<HomeScreen>(
              builder: (_) => const HomeScreen(),
              settings: settings,
            );
          case NotificationScreen.routeName:
            return MaterialPageRoute<NotificationScreen>(
              builder: (_) => const NotificationScreen(),
              settings: settings,
            );
          case SettingsScreen.routeName:
            return MaterialPageRoute<SettingsScreen>(
              builder: (_) => const SettingsScreen(),
              settings: settings,
            );
          case TransactionScreen.routeName:
            return MaterialPageRoute<TransactionScreen>(
              builder: (_) => const TransactionScreen(),
              settings: settings,
            );

          default:
            return MaterialPageRoute(
              builder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    'lib/assets/lottie/constructions.json',
                    width: 200,
                    height: 200,
                  ),
                  Text(
                    'No route defined for ${settings.name}',
                    style: headline4,
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
