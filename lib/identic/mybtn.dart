import 'package:flutter/material.dart';

class Mybton extends StatefulWidget {
  const Mybton({super.key});

  @override
  State<Mybton> createState() => _MybtonState();
}

class _MybtonState extends State<Mybton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-0.5, 0),
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onPressed() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: SlideTransition(
        position: _animation,
        child: ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.circle_rounded),
        ),
      ),
    );
  }
}
 