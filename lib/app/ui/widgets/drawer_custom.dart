import 'package:app/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: defaultTheme[900]),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 10,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Text(
                          'Nome do usuário',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading:
                const FaIcon(FontAwesomeIcons.building, color: Colors.black),
            title: const Text('Pedidos'),
            onTap: () {
              print('Clique em pedidos');
            },
          ),
          ListTile(
            leading:
                const FaIcon(FontAwesomeIcons.doorOpen, color: Colors.black),
            title: const Text('Sair'),
            onTap: () async {
              print('Sair');
            },
          ),
        ],
      ),
    );
  }
}
