import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class RadialMenu extends StatefulWidget {
  final List<Widget> children;

  RadialMenu({@required this.children});

  @override
  State<StatefulWidget> createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu> {
  List<LayoutId> _children = [];

  @override
  void didUpdateWidget(RadialMenu oldWidget) {
    super.didUpdateWidget(oldWidget);

    _children.clear();

    for (var i = 0; i < widget.children.length; ++i) {
      _children.add(LayoutId(id: i, child: widget.children[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: CustomMultiChildLayout(
        delegate: _RadialMenuMultiChildLayoutDelegate(length: _children.length),
        children: _children,
      ),
    );
  }
}

class _RadialMenuMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  final int length;

  _RadialMenuMultiChildLayoutDelegate(
      {@required this.length, Listenable relayout})
      : super(relayout: relayout);

  @override
  void performLayout(Size size) {
    final constraints = BoxConstraints.loose(size);
    final center = size.center(Offset.zero);

    final chunkRadius = 360 / length;

    final maxRadius = math.min(size.width, size.height) / 2;
    final radius = maxRadius;

    var angle = 0.0 + -90.0;

    for (var i = 0; i < length; ++i) {
      if (hasChild(i)) {
        final s = layoutChild(i, constraints);

        final radians = angle * (math.pi / 180);
        final r = radius - s.width / 2;

        final p = center
            .translate(r * math.cos(radians), r * math.sin(radians))
            .translate(-(s.width / 2), -(s.height / 2));

        positionChild(i, p);

        angle += chunkRadius;
      }
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) =>
      oldDelegate is! _RadialMenuMultiChildLayoutDelegate ||
          (oldDelegate as _RadialMenuMultiChildLayoutDelegate).length != length;
}
