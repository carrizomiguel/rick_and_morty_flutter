import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rickandmorty/core/core.dart';

class PortalLoader extends StatefulWidget {
  const PortalLoader({super.key});

  @override
  State<PortalLoader> createState() => PortalLoaderState();
}

class PortalLoaderState extends State<PortalLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 12.5664,
    ).animate(_controller);
    _controller.forward();
    _animation.addStatusListener(animationListener);
  }

  @override
  void dispose() {
    _animation.removeStatusListener(animationListener);
    _controller.dispose();
    super.dispose();
  }

  void animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value,
          child: SvgPicture.asset(
            Assets.portal,
          ),
        );
      },
    );
  }
}
