import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayIndicator extends StatelessWidget {
  final bool show;
  const OverlayIndicator({required this.show, super.key});

  @override
  Widget build(BuildContext context) {
    if (!show) {
      return SizedBox.shrink();
    }
    return Stack(
      children: [
        const ModalBarrier(
          dismissible: false,
          color: Colors.black26, // 半透明で操作不能を示す
        ),
        // 中央にインジケータ表示
        const Center(child: CupertinoActivityIndicator(radius: 16)),
      ],
    );
  }
}
