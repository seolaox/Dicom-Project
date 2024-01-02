import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  late bool switchValue; 

  @override
  void initState() {
    super.initState();
    switchValue = true;
  }
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: (
              CircleAvatar()
            ),
            accountName: Text('닥터'), 
            accountEmail: Text('doctor@hospital.com')),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('로그인'),
              onTap: () {
                //
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('설정'),
              onTap: () {
                //
              },
            ),
            ListTile(
              leading: Switch(
              value: switchValue,
                onChanged: (value) {
                  switchValue = value; 
                  // switchActions(); 
                },),
              title: Text('테마 변경'),
              onTap: () {
                //
              },
            ),
            
          ],
        ),
      );
  }
}