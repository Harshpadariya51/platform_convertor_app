import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/provider/contact_pro.dart';
import 'package:platform_convertor/provider/month_pro.dart';
import 'package:platform_convertor/provider/theme_pro.dart';
import 'package:platform_convertor/screen/android/home.dart';
import 'package:platform_convertor/screen/ios/home_p.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeChangeAppProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ContactProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => MonthProvider(),
          ),
        ],
        builder: (context, _) {
          return (Provider.of<ThemeChangeAppProvider>(context).isAndroid)
              ? MaterialApp(
                  debugShowCheckedModeBanner: false,
                  routes: {
                    '/': (context) => const HomeA(),
                  },
                  theme: ThemeData.light(useMaterial3: true),
                  darkTheme: ThemeData.dark(useMaterial3: true),
                  themeMode: ThemeMode.system,
                )
              : CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  routes: {
                    '/': (context) => const HomeI(),
                  },
                );
        });
  }
}
