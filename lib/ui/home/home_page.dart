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
              if (accessToken != null) {
                BlocProvider.of<HomeBloc>(context).getListMatkul(accessToken);
              }
            }
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
            body: Padding(
              padding: const EdgeInsets.all(16.0),
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

                  if (homestate.isError) {
                    return Center(child: Text(homestate.error));
                  }

                  return Column(
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
                      // const Divider(),
                      // ListView.builder(
                      //   itemCount: homestate.matkulTotal,
                      //   itemBuilder: (context, index) {
                      //     return MatkulItem(
                      //       perkuliahanItem: homestate.matkulData[index],
                      //     );
                      //   },
                      // )
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
