import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MainButtonWidget extends StatefulWidget {
  const MainButtonWidget(
      {super.key,
      required this.time,
      required this.onClickFunction,
      required this.text,
      required this.color});

  final int time;
  final String text;
  final Function() onClickFunction;
  final Color color;

  @override
  State<MainButtonWidget> createState() => _MainButtonWidgetState();
}

class _MainButtonWidgetState extends State<MainButtonWidget> {
  Timer? _timer;
  late double _percent = 0.0;
  late int _remainingSeconds = widget.time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _startCountdown(),
      onTapUp: (_) => _setInitialPercentage(),
      child: CircularPercentIndicator(
        center: Container(
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle
          ),
          child: Text(widget.text),
        ),
        radius: 140,
        lineWidth: 10,
        backgroundColor: Colors.blueGrey.shade200,
        progressColor: Colors.blueGrey.shade400,
        circularStrokeCap: CircularStrokeCap.round,
        animation: true,
        animateFromLastPercent: true,
        animationDuration: 1000,
        percent: _percent,
      ),
    );
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 0) {
        timer.cancel();
        widget.onClickFunction();
      } else {
        setState(() {
          _remainingSeconds--;
          _percent += (100 / widget.time) / 100;
        });
      }
    });
  }

  void _setInitialPercentage() {
    setState(() {
      _timer?.cancel();
      _remainingSeconds = widget.time;
      _percent = 0.0;
    });
  }
}
