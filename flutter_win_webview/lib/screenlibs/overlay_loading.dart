import 'package:flutter/material.dart';

class OverlayLoading extends StatelessWidget {
  //表示状態
  final bool visible;
  const OverlayLoading({super.key, required this.visible});
  @override
  Widget build(BuildContext context) {
    return visible
        ? Container(
            decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.6)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          )
        : Container();
  }
}
