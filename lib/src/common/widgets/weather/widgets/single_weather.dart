import 'package:flutter/material.dart';

import '../../../custom_shapes/containers/rounded_container.dart';

class TSingleWeather extends StatelessWidget {
  const TSingleWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: false,
      backgroundColor: Colors.blue.withOpacity(0.6),
      padding: const EdgeInsets.all(8.0),
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.location_on_sharp, color: Colors.white, size: 16.0,),
                Text("Ankara", style: TextStyle(color: Colors.white, fontSize: 16.0),),
              ],
            ),
          ),
          /// Row 1
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Icons
              SizedBox(
                child: Icon(Icons.cloud_rounded, color: Colors.white, size: 164.0),
              ),
            ],
          ),
          /// Row 2
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("29°", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 48.0),),
            ],
          ),
          /// Row 3
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Açık", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 24.0),),
            ],
          ),
          /// Row 4
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Pazartesi", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 24.0,)
        ],
      ),
    );
  }
}
