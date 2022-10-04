import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ges_op/ui/type_charge_exploitation/widgets/type_charge_exploitations_idproduit/bloc/type_charge_exploitations_idproduit_bloc.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../../models/models.dart';
import '../features.dart';

class NavDrawer extends StatefulWidget {
  static const String routeName = '/NavDrawer';

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return GFDrawer(
      // width: MediaQuery.of(context).size.width * 0.5, //<-- SEE HERE
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            // <-- SEE HERE
            decoration: BoxDecoration(color: Color(0xff764abc)),
            accountName: Text(
              "Prenom",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "pinkesh.earth@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: FlutterLogo(),
          ),
          ListTile(
            title: const Text("Home"),
            leading: IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // onTap: () => Navigator.pushNamed(context, route.homePage),

            onTap: () => Get.toNamed('/'),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: const Text("Compte Exploitation"),
            leading: IconButton(
              icon: const Icon(Icons.add_chart_sharp),
              onPressed: () {},
            ),
            onTap: () {
              Get.toNamed('/exploitationPage', arguments: {
                "title": "Liste Comptes",
                "utilisateur": ApiConstants.utilisateur
              });
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: const Text("Configuration"),
            leading: IconButton(
              icon: const Icon(Icons.account_balance),
              onPressed: () {},
            ),
            //onTap: () => Get.to(const SettingsPage()),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: const Text("Maintenance"),
            leading: IconButton(
              icon: const Icon(Icons.account_balance),
              onPressed: () {},
            ),
            // onTap: () => Get.toNamed('/maintenancePage', arguments: {"title": "Maintenance", "user": ApiConstants.user}),
            onTap: () => Get.toNamed('/loginMaintenancePage', arguments: {
              "title": "Login Maintenance",
              "utilisateur": ApiConstants.utilisateur
            }),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: const Text("Profile"),
            leading: IconButton(
              icon: const Icon(Icons.add_chart_sharp),
              onPressed: () {},
            ),
            onTap: () => Get.toNamed('/profilePage', arguments: {
              "title": "Profile",
              "utilisateur": ApiConstants.utilisateur
            }),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: const Text("Bottom"),
            leading: IconButton(
              icon: const Icon(Icons.add_chart_sharp),
              onPressed: () {},
            ),
            onTap: () => Get.toNamed('/bottomNavBar', arguments: {
              "title": "Bottom",
              "utilisateur": ApiConstants.utilisateur
            }),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: const Text("Graphes animées"),
            leading: IconButton(
              icon: const Icon(Icons.add_chart_sharp),
              onPressed: () {},
            ),
            onTap: () => Get.toNamed('/graphes'),
          ),
          const Divider(
            color: Colors.grey,
          ),
          const AboutListTile(
            // <-- SEE HERE
            icon: Icon(
              Icons.info,
            ),
            applicationIcon: Icon(
              Icons.local_play,
            ),
            applicationName: 'My Cool App',
            applicationVersion: '1.0.25',
            applicationLegalese: '© 2019 SIS\'Tech',
            aboutBoxChildren: [
              ///Content goes here...
            ],
            child: Text('Version'),
          ),
        ],
      ),
    );
  }
}
