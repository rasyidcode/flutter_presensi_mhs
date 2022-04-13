import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _nimFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isNimFocused = false;
  bool _isPasswordFocused = false;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _nimFocusNode.addListener(_onNimFocusChange);
    _passwordFocusNode.addListener(_onPasswordFocusChange);
  }

  @override
  void dispose() {
    _nimFocusNode.removeListener(_onNimFocusChange);
    _passwordFocusNode.removeListener(_onPasswordFocusChange);
    super.dispose();
  }

  void _onNimFocusChange() {
    setState(() {
      _isNimFocused = _nimFocusNode.hasFocus;
    });
  }

  void _onPasswordFocusChange() {
    setState(() {
      _isPasswordFocused = _passwordFocusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Halo mahasiswa, silahkan masukkan nim dan password dibawah!',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              const SizedBox(height: 12.0),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(
                            color: _isNimFocused ? kPrimaryColor : null,
                          ),
                          keyboardType: TextInputType.number,
                          focusNode: _nimFocusNode,
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: 'NIM',
                            prefixIcon: Icon(
                              Icons.person,
                              color: _isNimFocused ? kPrimaryColor : null,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.black12,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          style: TextStyle(
                            color: _isPasswordFocused ? kPrimaryColor : null,
                          ),
                          obscureText: _showPassword,
                          keyboardType: TextInputType.number,
                          focusNode: _passwordFocusNode,
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: _isPasswordFocused ? kPrimaryColor : null,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(
                                !_showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color:
                                    _isPasswordFocused ? kPrimaryColor : null,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.black12,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (kDebugMode) {
                              print('Lupa password ?');
                            }
                          },
                          child: const Text(
                            'Lupa password ?',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                        MaterialButton(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          color: kPrimaryButtonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          onPressed: () {
                            if (kDebugMode) {
                              print('Login');
                            }
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HomePage()));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          '* Apabila belum mempunyai password, silahkan hubungi pihak administrasi kampus.',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
