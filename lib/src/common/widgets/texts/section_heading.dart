import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor = Colors.black,
    this.buttonColor = Colors.grey,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = "Tümünü gör",
    this.onPressed
  });

  final Color? textColor, buttonColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,),
        if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle, style: TextStyle(color: buttonColor),))
      ],
    );
  }
}
