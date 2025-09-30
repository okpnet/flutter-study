

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Future<void> login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final pkceUrlJson=await rootBundle.loadString('assets/pkce_url.json');//アセットから
      final pkceUrlMap=jsonDecode(pkceUrlJson) as Map<String,dynamic>;
      final conf = PkceUrlConfig.fromMap(pkceUrlMap);

      final authModel = AuthStateModel(pkce: PKCEModel.generate());

      final provider = PkceAuthenticatorProver(
        urlConfig: conf,
        state: authModel,
        postProvider: HttpPostProvider(),
      );

      provider.stream.listen((e) {
        switch (e) {
          case AuthStartEvent _:
            print('開始');
            break;
          case AuthCompleteEvent a:
            print('成功: ${a.tokenStr}');
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
                : ElevatedButton(onPressed: login, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
