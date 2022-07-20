import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/home/home_page.dart';
import 'package:flutter_presensi_mhs/ui/login/login_page.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_bloc.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_event.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_state.dart';
import 'package:flutter_presensi_mhs/ui/welcome/welcome_page.dart';
import 'package:kiwi/kiwi.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashBloc _splashBloc = KiwiContainer().resolve<SplashBloc>();

  @override
  void initState() {
    super.initState();
    _splashBloc.add(InitDB());
  }

  @override
  void dispose() {
    _splashBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _splashBloc,
      child: Scaffold(
        body: BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              // has logged in
              if (state.isDBCreated) {
                _splashBloc.add(GetAuth());
              }

              if (state.isReadyToNavigate) {
                Future.delayed(const Duration(seconds: 2), () {
                  if (state.isLoggedIn) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const HomePage()));
                  } else if (state.isFirstTime) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const WelcomePage()));
                  } else if (!state.isFirstTime) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const LoginPage()));
                  }
                });
              }
            },
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo_mhs.png',
                  ),
                  BlocBuilder<SplashBloc, SplashState>(
                      builder: (context, state) {
                    return Column(
                      children: [
                        const SizedBox(height: 20.0),
                        (state.isLoading || state.isCreatingDB)
                            ? const CircularProgressIndicator(
                                color: kPrimaryButtonColor)
                            : Container(),
                        const SizedBox(height: 20.0),
                        Text(
                          state.statusMessage,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.white),
                        )
                      ],
                    );
                  })
                ],
              ),
            )),
      ),
    );
  }
}
