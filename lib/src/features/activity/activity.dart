import 'package:flutter/material.dart';
import '../../common/widgets/appbar/appbar.dart';
import 'widgets/activity_create.dart';
import 'widgets/activity_list.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key, this.title = 'Aktivitelerim'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: TAppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shoBackArrow: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ActivityCreate()));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 32.0,
              ),
            ),
          )
        ],
      ),

      /// Body
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: TActivityListItems(),
      ),
    );
  }
}
