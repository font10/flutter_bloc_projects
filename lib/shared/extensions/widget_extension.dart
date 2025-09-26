import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget paddingAll(double value) => Padding(padding: EdgeInsets.all(value), child: this);

  Widget padding(EdgeInsets padding) => Padding(padding: padding, child: this);

  Widget fill() => Positioned.fill(child: this);

  Widget onTap(VoidCallback? onTap) => GestureDetector(onTap: onTap, child: this);

  Widget paddingSymmetric({double? horizontal = 0.0, double? vertical = 0.0}) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: horizontal ?? 0.0, vertical: vertical ?? 0.0), child: this);

  Widget paddingOnly({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this,
      );

  Widget paddingFromLTRB({required double left, required double right, required double top, required double bottom}) =>
      Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);

  Widget marginAll(double value) => Padding(padding: EdgeInsets.all(value), child: this);

  Widget marginSymmetric({required double horizontal, required double vertical}) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical), child: this);

  Widget marginOnly({required double left, required double right, required double top, required double bottom}) =>
      Padding(padding: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom), child: this);

  Widget marginFromLTRB({required double left, required double right, required double top, required double bottom}) =>
      Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);

  Widget center() => Center(child: this);

  Widget fit() => FittedBox(child: this);

  Widget square(double value) => SizedBox.square(dimension: value, child: this);

  Widget safeArea({
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
  }) =>
      SafeArea(left: left, top: top, right: right, bottom: bottom, child: this);

  Widget showIf(bool value) => value ? this : const SizedBox.shrink();

  Widget align([AlignmentGeometry alignment = Alignment.center]) => Align(alignment: alignment, child: this);

  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget flexible({int flex = 1}) => Flexible(flex: flex, child: this);

  Widget backgroundColor(Color color) => Material(color: color, child: this);

  Widget visible(bool value) => Visibility(visible: value, child: this);

  Widget addDivider({
    double height = 1.0,
    Color color = Colors.grey,
    double indent = 0.0,
    double endIndent = 0.0,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        this,
        Divider(
          height: height,
          color: color,
          indent: indent,
          endIndent: endIndent,
        ),
      ],
    );
  }

  Widget responsiveConstrains({
    alignment = Alignment.topCenter,
    double minWidth = 0.0,
    double maxWidth = 600.0,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: this,
    ).align(alignment);
  }

  Widget toScrollableList(
      {int itemCount = 10,
        Axis scrollDirection = Axis.vertical,
        EdgeInsets padding = EdgeInsets.zero,
        Widget? separator,
        required List<Widget> products}) {
    List<Widget> items = products;
    if (separator != null) {
      items = items.expand((element) => [element, separator]).toList();
    }

    return SingleChildScrollView(
      padding: padding,
      scrollDirection: scrollDirection,
      child: scrollDirection == Axis.vertical ? Column(children: items) : Row(children: items),
    );
  }

  Widget listViewBuilder(
      {required Widget Function(BuildContext, int) itemBuilder,
        required int itemCount,
        Axis scrollDirection = Axis.vertical,
        EdgeInsets padding = EdgeInsets.zero}) {
    return ListView.builder(itemCount: itemCount, scrollDirection: scrollDirection, padding: padding, itemBuilder: itemBuilder);
  }

  Widget scrollable({Axis scrollDirection = Axis.vertical, EdgeInsets padding = EdgeInsets.zero}) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      padding: padding,
      child: this,
    );
  }
}
