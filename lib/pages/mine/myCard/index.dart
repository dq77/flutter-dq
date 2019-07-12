
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {

  const MyCard({
    Key key,
    @required this.child,
    this.color: Colors.white,
    this.shadowColor: const Color(0x70ADB3BF)
  }): super(key: key);
  
  final Widget child;
  final Color color;
  final Color shadowColor;
  
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(0.0),

          boxShadow: [
            BoxShadow(color: widget.shadowColor, offset: Offset(0.0, 3.0), blurRadius: 3.0, spreadRadius: 0.0)
          ]
      ),
      child: widget.child,
    );
  }
}
