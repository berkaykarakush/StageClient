import 'package:flutter/material.dart';
import 'package:stageclient/src/DTOs/Weather.dart';

import '../../../custom_shapes/containers/rounded_container.dart';

class TSingleWeather extends StatelessWidget {
  const TSingleWeather({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: false,
      backgroundColor: Colors.blue.withOpacity(0.6),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.location_on_sharp,
                  color: Colors.white,
                  size: 16.0,
                ),
                Text(
                  weather.city,
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ],
            ),
          ),

          /// Row 1
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Icons
              SizedBox(
                child:
                    Icon(Icons.cloud_rounded, color: Colors.white, size: 164.0),
              ),
            ],
          ),

          /// Row 2
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${weather.degree}°",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 48.0),
              ),
            ],
          ),

          /// Row 3
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weather.status,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 24.0),
              ),
            ],
          ),

          /// Row 4
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weather.day,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 16.0),
              ),
            ],
          ),
          const SizedBox(
            height: 24.0,
          )
        ],
      ),
    );
  }
}
