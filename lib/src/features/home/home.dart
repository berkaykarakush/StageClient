import 'package:flutter/material.dart';
import 'package:stageclient/src/common/widgets/texts/section_heading.dart';
import 'package:stageclient/src/common/widgets/weather/widgets/single_weather.dart';
import '../activity/activity.dart';
import '../activity/widgets/single_activity.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                const SizedBox(height: 16.0,),
                /// Activities
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                    children: [
                      /// Weather
                      const TSingleWeather(),
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
                      const TSingleActivity(),
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
