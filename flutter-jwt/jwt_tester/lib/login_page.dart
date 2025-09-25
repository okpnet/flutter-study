import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:jwt_tester/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:jwt_tester/jwt_client.dart' as jwt_client;
import 'package:openid_client/openid_client.dart';

Future<HttpClient> createSecureHtpClient() async{
  final context=SecurityContext(withTrustedRoots: false);
  final certBytes=await rootBundle.load('ca/fullchain.pem');
  context.setTrustedCertificatesBytes(certBytes.buffer.asUint8List());
  final client=HttpClient(context: context);
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



  Future<void> login() async{
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try{
    final String uri=dotenv.get('JWT_URL');


    // final clientSecret=await jwt_client.securePost(
    //   Uri.parse(uri),
    //   certPath: 'ca/fullchain.pem',
    //   headers: {'Content-Type':'application/x-www-form-urlencoded'},
    //   body: Uri(queryParameters: {
    //     'client_id':'qual-app',
    //     'client_secret':'qual-secret',
    //     'grant_type':'client_credentials'
    //   }).query,
    // );

    final response=await jwt_client.securePost(
      Uri.parse(uri),
      certPath: 'ca/fullchain.pem',
      headers: {'Content-Type':'application/x-www-form-urlencoded'},
      body: Uri(queryParameters: {
        'username':_usernameController.text,
        'password':_passwordController.text,
        'grant_type':'password',
        'client_id':'qual-app'
      }).query,
    );

    //response status code check
    //state 400 is client error {"error":"invalid_grant","error_description":"Account is not fully set up"}
    // If the response is 400, that probably no email.
    //state 401 is user none {"error":"invalid_grant","error_description":"Invalid user credentials"} 
    //state 401 is name or passwpowrd verifoed {"error":"invalid_grant","error_description":"Invalid user credentials"}
    //success 200 
    if(response.statusCode==200){
      final Map<String,dynamic> responseData=jsonDecode(response.body);
      print("Response Data: $responseData");
      //if it is access token in the body ,the successful login
      if(responseData['accessToken']!=null){
        SharedPreferences prefs=await SharedPreferences.getInstance();
        await prefs.setString('token', responseData['accessToken'] as String);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>const HomePage()),
        );
        print('Login successful, token saved.');

      }else if(responseData['message']!=null){
        showDialog(
          context: context,
          builder: (context)=>AlertDialog(
            title: const Text('Login Failed'),
            content: Text(responseData['message'] as String),
            actions: [
              TextButton(
                onPressed: ()=>Navigator.of(context).pop( ),
                child: const Text('close')
              )
            ],
          ),
        );
      }else{
        print('Login Error : Unexpected response format.');
        _isLoading=false;
      }
    }else{
      print('HTTP Error: ${response.statusCode}');
      _isLoading=false;
    }
    }finally{
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final String username = _usernameController.text;
    final String password = _passwordController.text;

    try {
      final response = await http.post(
        Uri.parse('https://yourapi.com/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String token = responseData['token'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        setState(() {
          _errorMessage = 'Invalid username or password';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred. Please try again.';
      });
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
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: login,
                  child: const Text('Login'),
                )
          ]
        )
      )
    );
  }
}