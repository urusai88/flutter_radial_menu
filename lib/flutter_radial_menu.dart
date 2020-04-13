import 'package:flutter/material.dart';
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
  void initState() {
    super.initState();

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

  _RadialMenuMultiChildLayoutDelegate({@required this.length});

  @override
  void performLayout(Size size) {
    final constraints = BoxConstraints.loose(size);
    final center = size.center(Offset.zero);

    for (var i = 0; i < length; ++i) {
      if (hasChild(i)) {
        final s = layoutChild(i, constraints);

        positionChild(i, center);
      }
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}
