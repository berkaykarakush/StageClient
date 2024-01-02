import 'package:flutter/material.dart';

import '../../common/widgets/appbar/appbar.dart';
import 'widgets/activity_list.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: TAppBar(title: Text('Aktivitelerim', style: Theme.of(context).textTheme.headlineSmall,), shoBackArrow: true),
      /// Body
      body: const Padding(
        padding: EdgeInsets.all(24.0),
         child: TActivityListItems(),
      ),
    );
  }
}
