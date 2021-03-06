import 'dart:async';
import 'dart:developer';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_state.dart';
import 'package:flutter_presensi_mhs/ui/home/home_bloc.dart';
import 'package:flutter_presensi_mhs/ui/home/home_event.dart';
import 'package:flutter_presensi_mhs/ui/home/home_state.dart';
import 'package:flutter_presensi_mhs/ui/home/widgets/home_drawer.dart';
import 'package:flutter_presensi_mhs/ui/home/widgets/matkul_item.dart';
import 'package:flutter_presensi_mhs/ui/login/login_page.dart';
import 'package:flutter_presensi_mhs/ui/scan/scan_page.dart';
import 'package:kiwi/kiwi.dart';
import 'package:flutter_presensi_mhs/extensions/string_extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthBloc _authBloc = KiwiContainer().resolve<AuthBloc>();
  final HomeBloc _homeBloc = KiwiContainer().resolve<HomeBloc>();

  @override
  void initState() {
    _authBloc.getAuth();

    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => _authBloc),
        BlocProvider<HomeBloc>(create: (_) => _homeBloc)
      ],
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, authstate) {
          String? currentState =
              BlocProvider.of<HomeBloc>(context).state.currentState;

          if (authstate.isHasAuth) {
            bool? isDoneGetAuth = authstate.isDoneGetAuth;
            if (isDoneGetAuth != null && isDoneGetAuth) {
              String? accessToken = authstate.auth.accessToken;
              if (accessToken != null) {
                BlocProvider.of<HomeBloc>(context).getListMatkul(accessToken);
              }
            }

            bool? isDoneRenewToken = authstate.isDoneRenewToken;
            if (isDoneRenewToken != null && isDoneRenewToken) {
              String? accessToken = authstate.auth.accessToken;
              if (accessToken != null && currentState != null) {
                if (currentState == 'get_list_matkul') {
                  BlocProvider.of<HomeBloc>(context).getListMatkul(accessToken);
                } else if (currentState == 'do_presensi') {
                  String? code =
                      BlocProvider.of<HomeBloc>(context).state.currentCode;
                  log('home_page:$code');
                  if (code != null) {
                    BlocProvider.of<HomeBloc>(context)
                        .doPresensi(accessToken, code);
                  }
                }
              }
            }
          }

          if (authstate.isError && currentState == 'get_list_matkul') {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(authstate.error)));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginPage()));
          }
        },
        builder: (context, authstate) {
          String? accessToken = authstate.auth.accessToken;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: const Text(
                'Home Page',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            drawer: authstate.isHasAuth && accessToken != null
                ? HomeDrawer(data: accessToken.jwtDecode())
                : Container(),
            body: RefreshIndicator(
              onRefresh: () async {
                String? accessToken = authstate.auth.accessToken;
                if (accessToken != null) {
                  BlocProvider.of<HomeBloc>(context).getListMatkul(accessToken);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocConsumer<HomeBloc, HomeState>(
                  listener: (context, homestate) {
                    bool? isTokenExpired = homestate.isTokenExpired;
                    if (isTokenExpired != null && isTokenExpired) {
                      if (authstate.isHasAuth) {
                        BlocProvider.of<AuthBloc>(context)
                            .renewToken(authstate.auth);
                      }
                    }
                  },
                  builder: (context, homestate) {
                    if (homestate.isLoading || authstate.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    bool? isTokenExpired = homestate.isTokenExpired;
                    if (homestate.isError && isTokenExpired == null) {
                      return Center(child: Text(homestate.error));
                    }

                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Perkuliahan Hari Ini',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            BlocProvider.of<HomeBloc>(context).getCurrentDate(),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const Divider(),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: homestate.matkulData.length,
                              itemBuilder: (context, index) {
                                return MatkulItem(
                                    perkuliahanItem:
                                        homestate.matkulData[index]);
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                String? accessToken = authstate.auth.accessToken;
                if (accessToken != null) {
                  BlocProvider.of<HomeBloc>(context).getListMatkul(accessToken);
                }
              },
              child: const Icon(Icons.refresh),
              backgroundColor: kPrimaryColor,
            ),
          );
        },
      ),
    );
  }
}
