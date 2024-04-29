import 'package:flutter/material.dart';

class TypewriterAnimation extends StatefulWidget {
  const TypewriterAnimation({required this.duration, required this.text, required this.textStyle,super.key});

  final String text;
  final TextStyle textStyle;
  final int duration;

  @override
  State<TypewriterAnimation> createState() => _TypewriterAnimationState();
}

class _TypewriterAnimationState extends State<TypewriterAnimation> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<int> animation;

  void _initAnimation() {

    controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    );
    animation = StepTween(
      begin: 0,
      end: widget.text.length,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ),
    );

    controller.forward();

  }

  @override
  void initState(){
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child){
        String text = widget.text.substring(0,animation.value);
        return Text(text, style: widget.textStyle,);
    });
  }
}
