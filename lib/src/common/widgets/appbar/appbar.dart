import 'package:flutter/material.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.shoBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed
  });

  final Widget? title;
  final bool shoBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: shoBackArrow ? IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back))
            : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
        title: title,
        actions: actions,
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
