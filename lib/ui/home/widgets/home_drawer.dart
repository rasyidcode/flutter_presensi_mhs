import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/jadwal/jadwal_page.dart';
import 'package:flutter_presensi_mhs/ui/profile/profile_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

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
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Ahmad Jamil Al Rasyid\n',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '1212121212',
                              style: TextStyle(
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
                    print('Jadwal Matkul');
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const JadwalPage()));
                },
                child: const ListTile(
                  leading: Icon(Icons.calendar_today, color: Colors.white),
                  title: Text(
                    'Jadwal Matkul',
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
                    print('Profile');
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const ProfilePage()));
                },
                child: const ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text(
                    'Profile',
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
