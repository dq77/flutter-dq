import 'package:flutter/material.dart';

class FullScreenDialog extends StatefulWidget {
  final Widget child;

  /// The distance that the child's left edge is inset from the left of the stack.
  ///
  /// Only two out of the three horizontal values ([left], [right], [width]) can be
  /// set. The third must be null.
  ///
  /// If all three are null, the [Stack.alignment] is used to position the child
  /// horizontally.
  final double left;

  /// The distance that the child's top edge is inset from the top of the stack.
  ///
  /// Only two out of the three vertical values ([top], [bottom], [height]) can be
  /// set. The third must be null.
  ///
  /// If all three are null, the [Stack.alignment] is used to position the child
  /// vertically.
  final double top;

  /// The distance that the child's right edge is inset from the right of the stack.
  ///
  /// Only two out of the three horizontal values ([left], [right], [width]) can be
  /// set. The third must be null.
  ///
  /// If all three are null, the [Stack.alignment] is used to position the child
  /// horizontally.
  final double right;

  /// The distance that the child's bottom edge is inset from the bottom of the stack.
  ///
  /// Only two out of the three vertical values ([top], [bottom], [height]) can be
  /// set. The third must be null.
  ///
  /// If all three are null, the [Stack.alignment] is used to position the child
  /// vertically.
  final double bottom;

  /// The child's width.
  ///
  /// Only two out of the three horizontal values ([left], [right], [width]) can be
  /// set. The third must be null.
  ///
  /// If all three are null, the [Stack.alignment] is used to position the child
  /// horizontally.
  final double width;

  /// The child's height.
  ///
  /// Only two out of the three vertical values ([top], [bottom], [height]) can be
  /// set. The third must be null.
  ///
  /// If all three are null, the [Stack.alignment] is used to position the child
  /// vertically.
  final double height;

  final Function onTapOutside;

  const FullScreenDialog({Key key, this.left, this.top, this.right, this.bottom, this.width, this.height, this.child, this.onTapOutside})
      : super(key: key);

  @override
  _FullScreenDialogState createState() => new _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  @override
  Widget build(BuildContext context) {
    var onDismiss = widget.onTapOutside ?? dismiss;

    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Container(
        child: new InkWell(
          onTap: onDismiss,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: new Stack(
            children: <Widget>[
              new Positioned(
                child: new InkWell(
                  child: widget.child,
                  onTap: () {},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                height: widget.height,
                width: widget.width,
                bottom: widget.bottom,
                left: widget.left,
                right: widget.right,
                top: widget.top,
              ),
            ],
          ),
        ),
      ),
    );
  }

  dismiss() {
    Navigator.of(context).pop();
  }
}
