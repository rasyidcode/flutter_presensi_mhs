import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/home/home_bloc.dart';
import 'package:flutter_presensi_mhs/ui/home/home_event.dart';
import 'package:flutter_presensi_mhs/ui/home/home_state.dart';
import 'package:flutter_presensi_mhs/ui/home/widgets/home_drawer.dart';
import 'package:flutter_presensi_mhs/ui/home/widgets/matkul_item.dart';
import 'package:kiwi/kiwi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = KiwiContainer().resolve<HomeBloc>();

  @override
  void initState() {
    _homeBloc.initGetAuth();

    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.isGetAuthFinished) {
          // _homeBloc.setAuth(state.auth);
          // _homeBloc.add(GetListMatkul());
        }

        bool? isExpiredToken = state.isExpiredToken;
        if (isExpiredToken != null && isExpiredToken) {
          _homeBloc.add(RenewToken());
        }

        if (state.isTokenRenewed) {
          _homeBloc.add(GetListMatkul());
        }
      },
      child: Scaffold(
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
        drawer: const HomeDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Perkuliahan Hari Ini',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Senin, 27 Okt 2022',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const Divider(),
                  Column(
                    children: const [
                      MatkulItem(),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
