import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_state.dart';
import 'package:flutter_presensi_mhs/ui/home/home_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:flutter_presensi_mhs/extensions/string_extensions.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBloc _authBloc = KiwiContainer().resolve<AuthBloc>();
    String? accessToken = _authBloc.state.auth.accessToken;
    DrawerData _data =
        accessToken != null ? accessToken.jwtDecode() : DrawerData('', '');
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
                              text: '${_data.name}\n',
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: _data.id,
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
                  // todo: check if right now in home_page, if yes just close the drawer, if no navigate to home_page
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
                  _authBloc.logout(_authBloc.state.auth);
                },
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      bool? isLoadingLogout = state.isLoadingLogout;
                      if (isLoadingLogout != null && isLoadingLogout) {
                        return const CircularProgressIndicator(
                            color: kPrimaryButtonColor);
                      }

                      return Container();
                    },
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
