import 'package:easyhome/components/Navbar/components/login_container.dart';
import 'package:easyhome/components/Navbar/components/logo.dart';
import 'package:easyhome/components/Navbar/components/not_login_container.dart';
import 'package:easyhome/redux/store/store.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:easyhome/main.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Navbar extends StatefulWidget {
  Navbar({this.color, @required this.context, Key key}) : super(key: key);

  final Color color;
  final BuildContext context;

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation containerAnimation;
  Animation opacityBackground;
  bool isExpanded = false;
  bool isLogIn;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    containerAnimation = Tween<double>(
      begin: 0,
      end: store.state.isLogIn
          ? MediaQuery.of(widget.context).size.width * 1.05
          : MediaQuery.of(widget.context).size.width / 1.25,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.fastOutSlowIn,
    ))
      ..addStatusListener((status) {
        if (status == AnimationStatus.forward) {
          isExpanded = true;
        }
        if (status == AnimationStatus.dismissed) {
          isExpanded = false;
        }
      });

    opacityBackground = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller)
      ..addListener(() => setState(() {}));
  }

  void expandContainer() {
    _controller.forward();
  }

  void collapseContainer() {
    _controller.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      key: UniqueKey(),
      onWillPop: () async {
        isExpanded ? _controller.reverse() : Navigator.pop(context);
        return Future(() => false);
      },
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(SizeConfig.horizontal * 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(
                  color: widget.color,
                ),
              ],
            ),
          ),
          isExpanded
              ? GestureDetector(
                  onTap: () => _controller.reverse(),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 700),
                    opacity: opacityBackground.value,
                    child: Container(
                      color: Color(0xAA000000),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          StoreConnector<AppState, bool>(
            converter: (store) => store.state.isLogIn,
            builder: (context, isLogIn) => Container(
              width: double.infinity,
              height: containerAnimation.value,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  )
                ],
              ),
              child: isLogIn ? LoginContainer() : NotLoginContainer(),
            ),
          ),
          GestureDetector(
            onTap: () {
              !isExpanded ? expandContainer() : collapseContainer();
            },
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.horizontal * 5),
              child: Align(
                alignment: Alignment.topRight,
                child: AnimatedIcon(
                  color: Colors.black,
                  icon: AnimatedIcons.menu_close,
                  size: SizeConfig.horizontal * 6,
                  progress: _controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
