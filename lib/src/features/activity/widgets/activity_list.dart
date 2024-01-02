import 'package:flutter/material.dart';
import 'package:stageclient/src/common/custom_shapes/containers/rounded_container.dart';

class TActivityListItems extends StatelessWidget {
  const TActivityListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_,__) => const SizedBox(height: 8.0,),
      itemCount: 10,
      itemBuilder: (_, index) => TRoundedContainer(
        showBorder: true,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row 1
            Row(
              children: [
                /// Icons
                const Icon(Icons.local_shipping_outlined),
                const SizedBox(width: 8.0,),
                /// Status, Date
                Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bekleniyor", style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.red, fontWeightDelta: 1),)
                      ],
                    )
                ),
                /// Icon
                IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward, size: 16.0,)),
              ],
            ),
            SizedBox(height: 16.0,),
            /// Row 2
            Row(
              children: [
                /// Icons
                const Icon(Icons.local_shipping_outlined),
                const SizedBox(width: 8.0,),
                /// Status, Date
                Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bekleniyor", style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.red, fontWeightDelta: 1),)
                      ],
                    )
                ),
                /// Icon
                IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward, size: 16.0,)),
              ],
            ),
            SizedBox(height: 16.0,),
          ],
        ),
      ),
    );
  }
}
