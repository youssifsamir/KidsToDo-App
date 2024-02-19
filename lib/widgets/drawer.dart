//packages
import 'package:flutter/material.dart';
import 'package:memo_app/screens/qrVouchers.dart';
import 'package:provider/provider.dart';

//providers
import '../providers/accounts.dart';

class MainDrawer extends StatelessWidget {
  final String username;

  MainDrawer({required this.username});

  Widget buildListTile(
      String title, IconData icon, BuildContext ctx, VoidCallback tapHandler) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: ListTile(
        leading: Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: Theme.of(ctx).textTheme.labelSmall,
        ),
        onTap: tapHandler,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccountsProvider>(context);
    return Drawer(
      backgroundColor: Colors.indigo,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 80),
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Container(
                  height: 250,
                  width: 250,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 25,
                right: 25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(),
                    child: SizedBox(
                      child: Image.asset(
                        account.getByUsername(username).avatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: 100,
              height: 50,
              color: Colors.white,
              child: Center(
                child: Text(
                  username,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          buildListTile(
            'Courses',
            Icons.note_alt,
            context,
            () {},
          ),
          buildListTile(
            'Daily Tips',
            Icons.tips_and_updates,
            context,
            () {},
          ),
          buildListTile(
            'Settings',
            Icons.settings,
            context,
            () {},
          ),
          buildListTile(
            'Logout',
            Icons.logout,
            context,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const SizedBox(height: 20),
          buildListTile(
            'QR Vouchers',
            Icons.qr_code,
            context,
            () {
              Navigator.of(context).pushNamed(QRvouchers.routeName);
            },
          ),
        ],
      ),
    );
  }
}
