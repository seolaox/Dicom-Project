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
      backgroundColor: Colors.grey,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 71, 70, 70)
            ),
              currentAccountPicture: (CircleAvatar(
                backgroundImage: AssetImage('images/doctor icon.webp'), 

              )),
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
            title: Row(
              children: [
                Text('테마 변경'),
                Switch(
                  value: switchValue,
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                    // switchActions();
                  },
                ),
              ],
            ),
            onTap: () {
              //
            },
          ),
        ],
      ),
    );
  }
}
