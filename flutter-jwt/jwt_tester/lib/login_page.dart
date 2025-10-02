import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jwt_tester/main.dart';
import 'package:jwt_tester/pms_services/models/events/auth_logout_event.dart';
import 'package:jwt_tester/pms_services/models/token_model_extension.dart';
import 'pms_services/providers/pms_provider.dart';

Future<HttpClient> createSecureHtpClient() async {
  final context = SecurityContext(withTrustedRoots: false);
  final certBytes = await rootBundle.load('ca/fullchain.pem');
  context.setTrustedCertificatesBytes(certBytes.buffer.asUint8List());
  final client = HttpClient(context: context);
  return client;
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  String token="";

  final authModel = AuthStateModel(pkce: PKCEModel.generate());

  Future<void> refresh() async{
    
    final provider = getit<PkceAuthenticatorProvider>();

      provider.stream.listen((e) {
        switch (e) {
          case AuthCompleteEvent a:
            print('refresh成功: ${a.tokenModel.accessToken}');
            setState(() {
              token = a.tokenModel.accessToken;
            });

            break;
          case AuthFailEvent _:
            print('失敗');
            break;
        }
      });
    await provider.forcceRefreshToken();
  }

  Future<void> logout() async {
    final provider = getit<PkceAuthenticatorProvider>();

    provider.stream.listen((e) {
      switch (e) {
        case AuthLogoutEvent _:
          print('ログアウト');
          setState(() {
            token="";
          });
          break;
        case AuthFailEvent _:
          print('失敗');
          break;
      }
    });
    await provider.logout();
  }

  Future<void> login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final provider = getit<PkceAuthenticatorProvider>();

      provider.stream.listen((e) {
        switch (e) {
          case AuthStartEvent _:
            print('login開始');
            break;
          case AuthCompleteEvent a:
            print('成功: ${a.tokenModel.accessToken}');
            setState(() {
              final userInfo=a.tokenModel.extractUserInfo();
              token = jsonEncode(userInfo.toMap());
              print(token);
            });
            break;
          case AuthFailEvent _:
            print('失敗');
            break;
        }
      });

      await provider.login();

      //response status code check
      //state 400 is client error {"error":"invalid_grant","error_description":"Account is not fully set up"}
      // If the response is 400, that probably no email.
      //state 401 is user none {"error":"invalid_grant","error_description":"Invalid user credentials"}
      //state 401 is name or passwpowrd verifoed {"error":"invalid_grant","error_description":"Invalid user credentials"}
      //success 200
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            token.isEmpty ? Text( "no token") :Text(token),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : Row(
                  children: [ ElevatedButton(onPressed: login, child: const Text('Login')), ElevatedButton(onPressed: logout, child: const Text('Logout')), ElevatedButton(onPressed: refresh, child: const Text('Refresh'))],
                )
          ],
        ),
      ),
    );
  }
}
