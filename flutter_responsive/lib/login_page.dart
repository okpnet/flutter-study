import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 200.0, minWidth: 100.0),
          child: FractionallySizedBox(
            widthFactor: screenWidth > 600 ? 0.4 : 0.9,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                color: Colors.amber,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      color: Colors.brown[200],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'ID',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text('Page move'),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)
                                )
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Prev"),
                            ),
                            SizedBox(width: 16,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.inversePrimary,),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Next"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
