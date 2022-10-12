import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/extensions/string_extensions.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_state.dart';
import 'package:flutter_presensi_mhs/ui/home/home_bloc.dart';
import 'package:flutter_presensi_mhs/ui/home/home_state.dart';
import 'package:flutter_presensi_mhs/ui/home/widgets/matkul_item.dart';
import 'package:flutter_presensi_mhs/ui/login/login_page.dart';
import 'package:flutter_presensi_mhs/ui/scan/scan_page.dart';
import 'package:kiwi/kiwi.dart';

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
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => _authBloc),
        BlocProvider<HomeBloc>(create: (_) => _homeBloc)
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {
            String? currentState =
                BlocProvider.of<HomeBloc>(context).state.currentState;
            if (state.isHasAuth) {
              bool? isDoneGetAuth = state.isDoneGetAuth;
              if (isDoneGetAuth != null && isDoneGetAuth) {
                String? accessToken = state.auth.accessToken;
                if (accessToken != null) {
                  BlocProvider.of<HomeBloc>(context).getListMatkul(accessToken);
                }
              }

              bool? isDoneRenewToken = state.isDoneRenewToken;
              if (isDoneRenewToken != null && isDoneRenewToken) {
                String? accessToken = state.auth.accessToken;
                if (accessToken != null && currentState != null) {
                  if (currentState == 'get_list_matkul') {
                    BlocProvider.of<HomeBloc>(context)
                        .getListMatkul(accessToken);
                  } else if (currentState == 'do_presensi') {
                    String? code =
                        BlocProvider.of<HomeBloc>(context).state.currentCode;
                    String? idJadwal = BlocProvider.of<HomeBloc>(context)
                        .state
                        .currentIdJadwal;
                    if (code != null && idJadwal != null) {
                      BlocProvider.of<HomeBloc>(context)
                          .doPresensi(accessToken, code, idJadwal);
                    }
                  }
                }
              }
            }

            if (state.isError && currentState == 'get_list_matkul') {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginPage()));
            }

            bool? isSuccessLogout = state.isSuccessLogout;
            if (isSuccessLogout != null) {
              if (!isSuccessLogout) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              } else {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginPage()));
              }
            }
          }),
          BlocListener<HomeBloc, HomeState>(listener: (context, state) async {
            bool? isTokenExpired = state.isTokenExpired;
            var authstate = BlocProvider.of<AuthBloc>(context).state;
            if (isTokenExpired != null && isTokenExpired) {
              if (authstate.isHasAuth) {
                BlocProvider.of<AuthBloc>(context).renewToken(authstate.auth);
              }
            }

            if (state.isError && state.currentState == 'do_presensi') {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }

            bool? isSuccessCheckPresensi =
                BlocProvider.of<HomeBloc>(context).state.isSuccessCheckPresensi;
            if (isSuccessCheckPresensi != null) {
              if (!isSuccessCheckPresensi) {
                String error = state.error;
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(error)));
              } else {
                String? accessToken = authstate.auth.accessToken;
                String? idJadwal = state.currentIdJadwal;
                if (accessToken != null && idJadwal != null) {
                  String code = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ScanPage()));

                  if (!mounted) return;

                  BlocProvider.of<HomeBloc>(context)
                      .doPresensi(accessToken, code, idJadwal);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Something went wrong! code: #home_page')));
                }
              }
            }
          }),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, authstate) {
          String? accessToken = authstate.auth.accessToken;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: accessToken != null && accessToken.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          accessToken.jwtDecode().name,
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Text(
                          accessToken.jwtDecode().id,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    )
                  : Container(),
              actions: [
                IconButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).logout(authstate.auth);
                    },
                    icon: const Icon(Icons.logout_outlined))
              ],
            ),
            backgroundColor: Colors.white,
            body: RefreshIndicator(
              onRefresh: () async {
                String? accessToken = authstate.auth.accessToken;
                if (accessToken != null) {
                  _homeBloc.getListMatkul(accessToken);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Perkuliahan Hari Ini',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      _getCurrentDate(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const Divider(),
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        bool? isLoading = state.isLoading;
                        bool? isLoadingAuth = authstate.isLoading;
                        if (isLoading != null && isLoadingAuth != null) {
                          if (isLoading || isLoadingAuth) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }

                        bool? isTokenExpired = state.isTokenExpired;
                        if (state.isError && isTokenExpired == null) {
                          if (state.currentState == 'get_list_matkul') {
                            return Center(child: Text(state.error));
                          }
                        }
                        log('matkul data length: ${state.matkulData.length}');
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.matkulData.length,
                          itemBuilder: (context, index) {
                            return MatkulItem(
                                perkuliahanItem: state.matkulData[index]);
                          },
                        );
                      },
                    )
                  ],
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
        }),
      ),
    );
  }

  String _getCurrentDate() {
    var now = DateTime.now();
    var month = '';
    switch (now.month) {
      case 1:
        month = 'Januari';
        break;
      case 2:
        month = 'Februari';
        break;
      case 3:
        month = 'Maret';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'Mei';
        break;
      case 6:
        month = 'Juni';
        break;
      case 7:
        month = 'Juli';
        break;
      case 8:
        month = 'Agustus';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'Oktober';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'Desember';
        break;
      default:
        month = 'undefined';
        break;
    }

    var day = '';
    switch (now.weekday) {
      case 1:
        day = 'Senin';
        break;
      case 2:
        day = 'Selasa';
        break;
      case 3:
        day = 'Rabu';
        break;
      case 4:
        day = 'Kamis';
        break;
      case 5:
        day = 'Jum\'at';
        break;
      case 6:
        day = 'Sabtu';
        break;
      case 7:
        day = 'Minggu';
        break;
    }
    return '$day, ${now.day} $month ${now.year}';
  }
}
