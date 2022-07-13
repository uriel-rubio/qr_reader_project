import 'package:flutter/material.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primary = Colors.indigo;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader App',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomeScreen(),
          'mapa': (context) => const MapScreen(),
        },
        theme: ThemeData(
          primaryColor: primary,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: primary,
          ),
          appBarTheme: const AppBarTheme(
            color: primary,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: primary,
          ),
        ),
      ),
    );
  }
}
