import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: 50.0,
                    child: Text(
                      'PP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Ahmad Jamil Al Rasyid',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '2020.10220.3012333',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
