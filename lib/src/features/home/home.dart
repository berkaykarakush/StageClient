import 'package:flutter/material.dart';
import 'package:stageclient/src/DTOs/Weather.dart';
import '../../DTOs/Activity/Activity.dart';
import '../../common/widgets/texts/section_heading.dart';
import '../../common/widgets/weather/widgets/single_weather.dart';
import '../../services/StageAPI/StageAPI.dart';
import '../activity/activity.dart';
import '../activity/widgets/single_activity.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.datetime = ''});

  late String datetime;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    DateTime date = DateTime.now();
    widget.datetime = "${date.day < 10 ? '0${date.day}':date.day}.${date.month < 10 ? '0${date.month}':date.month}.${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                /// App Bar
                const THomeAppBar(),
                const SizedBox(
                  height: 16.0,
                ),

                /// Activities
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                    children: [
                      /// Weather
                      FutureBuilder(
                          future:
                              StageAPI.getWeather("ankara", widget.datetime),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.hasError}');
                            } else {
                              Weather weather = snapshot.data!;
                              return TSingleWeather(weather: weather);
                            }
                          }),
                      const SizedBox(height: 24.0),

                      /// Heading
                      TSectionHeading(
                          title: "Aktiviteler",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ActivityScreen()));
                          }),

                      /// Activities
                      const SizedBox(height: 24.0),
                      FutureBuilder(
                          future: StageAPI.getActivity(
                              "c458b4e0-b2ba-4fd8-aacd-3fadf9240312"),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.hasError}');
                            } else {
                              Activity activity = snapshot.data!;
                              return TSingleActivity(activity: activity);
                            }
                          }),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
