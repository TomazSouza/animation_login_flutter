import 'package:animation_login/screens/home/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';

class CategoryViewWidget extends StatefulWidget {
  const CategoryViewWidget({super.key});

  @override
  State<CategoryViewWidget> createState() => _CategoryViewWidgetState();
}

class _CategoryViewWidgetState extends State<CategoryViewWidget> {
  final List<String> categories = ["Trabalho", "Estudos", "Casa"];

  int _category = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButtonWidget(
          onPressed: _onPressedBackward,
          iconData: Icons.arrow_back_ios,
        ),
        Text(
          categories[_category].toUpperCase(),
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        IconButtonWidget(
          onPressed: _onPressedForward,
          iconData: Icons.arrow_forward_ios,
        ),
      ],
    );
  }

  void _onPressedForward() {
    if (_category < (categories.length - 1)) {
      return setState(() {
        _category++;
      });
    }
    return;
  }

  void _onPressedBackward() {
    if (_category > 0) {
      return setState(() {
        _category--;
      });
    }
    return;
  }
}
