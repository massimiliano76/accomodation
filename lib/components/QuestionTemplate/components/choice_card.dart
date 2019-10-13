import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class ChoiceCard extends StatefulWidget {
  ChoiceCard({this.label, this.isSelected});

  final String label;
  final bool isSelected;

  @override
  _ChoiceCardState createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<ChoiceCard> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = ColorTween(
      begin: Colors.white,
      end: Theme.of(context).accentColor,
    ).animate(_controller)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    print('dispose');
    super.dispose();
  }

  forward() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    widget.isSelected ? _controller.forward() : _controller.reverse();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: _animation.value,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0x11444444),
              offset: Offset(6.0, 6.0),
              blurRadius: 10,
            )
          ]),
      child: Center(
        child: Text(
          widget.label == null ? 'Palermo' : widget.label,
          style: TextStyle(
            fontSize: SizeConfig.horizontal * 4,
            color: widget.isSelected ? Colors.white : Color(0xFF707070),
          ),
        ),
      ),
    );
  }
}
