import 'package:flutter/material.dart';

import '../../../common/custom_shapes/containers/rounded_container.dart';

class TSingleActivity extends StatelessWidget {
  const TSingleActivity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Row 1
          Row(
            children: [
              /// Icons
              const Icon(Icons.tag, size: 16.0,),
              const SizedBox(
                width: 8.0,
              ),

              /// Status, Date
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Past Activity 1",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: Colors.red, fontWeightDelta: 1),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "11/10/2023",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: Colors.grey, fontWeightDelta: 1),
                  ),
                ],
              )),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),

          /// Row 2
          Row(
            children: [
              /// Status, Date
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Activity 2 months ago",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: Colors.black, fontWeightDelta: 1),
                  )
                ],
              )),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
