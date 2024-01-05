import 'package:flutter/material.dart';
import '../../../DTOs/Activity/Activity.dart';
import '../../../services/StageAPI/StageAPI.dart';
import 'activity_details.dart';
import 'single_activity.dart';

class TActivityListItems extends StatefulWidget {
  const TActivityListItems({Key? key}) : super(key: key);

  @override
  _TActivityListItemsState createState() => _TActivityListItemsState();
}

class _TActivityListItemsState extends State<TActivityListItems> {
  late List<Activity> activities;
  late int pageNumber;

  @override
  void initState() {
    super.initState();
    activities = [];
    pageNumber = 1;
    _loadActivities();
  }

  Future<void> _loadActivities() async {
    try {
      List<Activity> newActivities =
          await StageAPI.getAllActivities(pageNumber.toString(), 10.toString());

      setState(() {
        activities.addAll(newActivities);
        pageNumber++;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(height: 8.0),
            itemCount: activities.length,
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ActivityDetails(activity: activities[index]),
                  ),
                );
              },
              child: TSingleActivity(activity: activities[index]),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _loadActivities,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
          child: Text(
            'Load More',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
