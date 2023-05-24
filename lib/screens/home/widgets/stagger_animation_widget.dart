import 'package:flutter/material.dart';

import 'home_top_widget.dart';

class StaggerAnimationWidget extends StatelessWidget {
  StaggerAnimationWidget({
    required this.controller,
    super.key,
  }) : containerGrow = CurvedAnimation(
          parent: controller,
          curve: Curves.ease,
        );

  final Animation<double> controller;
  final Animation<double> containerGrow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? widget) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        HomeTop(
          containerGrow: containerGrow,
        ),
      ],
    );
  }
}
