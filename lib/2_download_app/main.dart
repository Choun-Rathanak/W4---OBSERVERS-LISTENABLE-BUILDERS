import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/providers/theme_color_provider.dart';
import 'ui/screens/settings/settings_screen.dart';
import 'ui/screens/downloads/downloads_screen.dart';
import 'ui/theme/theme.dart';




void main() {
  runApp(ChangeNotifierProvider(   // use this for hold ThemeColor Provider can the widget below mainapp can use the instance and method 
    create: (context) => ThemeColorProvider(),   
    child:const MyApp()
    ),
  );
    
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 1;

  final List<Widget> _pages =  [DownloadsScreen(), SettingsScreen()];
  
  @override
  Widget build(BuildContext context) {
    ThemeColorProvider colorProvider = Provider.of<ThemeColorProvider>(context);  // use provider in the widget for use the instance and lister to rebuild the ui when user tap
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(
        body: _pages[_currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: colorProvider.curTheme.color,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Downloads'),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
