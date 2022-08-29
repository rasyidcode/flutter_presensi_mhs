import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_state.dart';
import 'package:flutter_presensi_mhs/ui/home/home_page.dart';
import 'package:flutter_presensi_mhs/ui/login/login_page.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_bloc.dart';
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
  final AuthBloc _authBloc = KiwiContainer().resolve<AuthBloc>();

  @override
  void initState() {
    _splashBloc.checkFirstTime();
    super.initState();
  }

  @override
  void dispose() {
    _splashBloc.close();
    _authBloc.close();
    super.dispose();
  }

  void splashListener(BuildContext context, SplashState state) {}

  void authListener(BuildContext context, AuthState state) {}

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => _authBloc),
        BlocProvider<SplashBloc>(create: (_) => _splashBloc)
      ],
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo_mhs.png',
              ),
              BlocConsumer<SplashBloc, SplashState>(
                listener: (context, splashstate) {
                  bool? isFirstTime = splashstate.isFirstTime;
                  if (isFirstTime != null) {
                    if (isFirstTime) {
                      Timer(const Duration(seconds: 2), () {
                        log('${(SplashPage).toString()} - navigate to welcome page');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => const WelcomePage()));
                      });
                    } else {
                      context.read<AuthBloc>().getAuth();
                    }
                  }
                },
                builder: (context, splashstate) {
                  return BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, authstate) {
                      if (authstate.isReadyToNavigate) {
                        Timer(
                          const Duration(seconds: 1),
                          () {
                            if (authstate.isHasAuth) {
                              log('${(SplashPage).toString()} - navigate to home page');
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => const HomePage()));
                            } else {
                              log('${(SplashPage).toString()} - navigate to login page');
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => const LoginPage()));
                            }
                          },
                        );
                      }
                    },
                    builder: (context, authstate) {
                      return Column(
                        children: [
                          const SizedBox(height: 20.0),
                          splashstate.isLoading || authstate.isLoading
                              ? const CircularProgressIndicator(
                                  color: kPrimaryButtonColor)
                              : Container(),
                          const SizedBox(height: 20.0),
                          !splashstate.hideStateMessage
                              ? Text(
                                  splashstate.stateMessage,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.white),
                                )
                              : authstate.stateMessage != null
                                  ? Text(
                                      authstate.stateMessage!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(color: Colors.white),
                                    )
                                  : Text(
                                      'Loading...',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(color: Colors.white),
                                    )
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
