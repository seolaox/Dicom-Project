import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system; //사용자의 시스템에 따라 다크모드,라이트모드 설정되도록 하겠다.

  _changeThemeMode(ThemeMode themeMode){
    _themeMode = themeMode;
    setState(() {
      
    }); //setState로 화면 바뀌도록 설정하는것 , 다른 클래스에서는 thememode만 적용시키면 됨! 
  }

   //class밑에 있으니까 얘넨 property 
  //static으로 쓰는애들은 언제든 참조가능
  static const seedColor = Colors.black;

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
                // ******* 
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: _themeMode,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: seedColor,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: seedColor,
      ),
      home: Home(onChangeTheme: _changeThemeMode),
      debugShowCheckedModeBanner: false,
    );
  }
}
