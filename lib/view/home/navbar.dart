import 'package:flutter/material.dart';
import 'package:worktopuser/view/login/login_screen.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          AppBar(
            backgroundColor: const Color.fromARGB(255, 49, 52, 90),
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Scaffold.of(context).closeDrawer(),
            ),
          ),
          const UserAccountsDrawerHeader(
            accountName: Text('DrinkLink'),
            accountEmail: Text('WorkTop'),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 49, 52, 90),
              image: DecorationImage(
                // fit: BoxFit.fill,
                image: AssetImage('assets/images/icon_a.png'),
              ),
            ),
          ),
          // const DrawerHeader(
          //   margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
          //   child: Text(
          //     'Side menu',
          //     style: TextStyle(color: Colors.white, fontSize: 25),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Color.fromARGB(255, 49, 52, 90),
          //     image: DecorationImage(
          //       // fit: BoxFit.fill,
          //       image: AssetImage('assets/images/icon_a.png'),
          //     ),
          //   ),
          // ),
          // ListTile(
          //   leading: Icon(Icons.input),
          //   title: Text('Welcome'),
          //   onTap: () => {},
          // ),
          // ListTile(
          //   leading: Icon(Icons.verified_user),
          //   title: Text('Profile'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            // onTap: () => {Navigator.of(context).pop()},
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
