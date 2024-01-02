import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = 16.0,
    this.child,
    this.showBorder = false,
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.padding,
    this.margin
  });

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor.withOpacity(0.4)) : null,
      ),
      child: child,
    );
  }
}
