import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  
  const IconButtonWidget({
    required this.onPressed,
    required this.iconData,
    super.key,
  });

  final VoidCallback? onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Colors.white,
      disabledColor: Colors.white30,
      icon: Icon(iconData),
    );
  }
}
