import 'package:flutter/material.dart';
import 'package:stageclient/src/common/widgets/appbar/appbar.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Stage", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 24.0)),
        ],
      )
    );
  }
}
