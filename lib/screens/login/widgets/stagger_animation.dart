import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({super.key, required this.controller})
      : buttonSqueeze = Tween<double>(
          begin: 320,
          end: 60,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.150),
          ),
        ),
        buttonZoomOut = Tween<double>(
          begin: 60,
          end: 1000,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(0.5, 1, curve: Curves.bounceOut),
        ));

  final AnimationController controller;

  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: buttonZoomOut.value <= 60
            ? Container(
                width: buttonSqueeze.value,
                height: 60,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(247, 64, 106, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: _buildInside(context),
              )
            : Container(
                width: buttonZoomOut.value,
                height: buttonZoomOut.value,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(247, 64, 106, 1.0),
                  shape: buttonZoomOut.value < 500
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                ),
              ),
      ),
    );
  }

  Widget _buildInside(BuildContext context) {
    if (buttonSqueeze.value > 75) {
      return const Text(
        "Sign in",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      );
    }
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      strokeWidth: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
