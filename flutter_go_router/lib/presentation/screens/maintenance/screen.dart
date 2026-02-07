import 'package:flutter/material.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // メンテナンスアイコン
              Icon(
                Icons.build_rounded,
                size: 120,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 32),

              // メンテナンスタイトル
              const Text(
                'メンテナンス中',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // メンテナンスメッセージ
              const Text(
                'アプリは現在メンテナンス中です。\nご不便をおかけして申し訳ございません。\n後ほど再度お試しください。',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
