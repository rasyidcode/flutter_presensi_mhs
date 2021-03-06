import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/home/home_bloc.dart';

class HomeDrawer extends StatelessWidget {
  final DrawerData data;

  const HomeDrawer({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kPrimaryColor,
        child: Column(
          children: [
            SizedBox(
              height: 120.0,
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      child: Text(
                        'AJA',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      radius: 24.0,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${data.name}\n',
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: data.id,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (kDebugMode) {
                    print('home');
                  }
                },
                child: const ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (kDebugMode) {
                    print('Logout');
                  }
                },
                child: const ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Text(
              'version 1.0',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0)
          ],
        ),
      ),
    );
  }
}
