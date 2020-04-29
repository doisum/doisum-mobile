import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class DismissableScaffold extends StatelessWidget {
  final Widget child;

  const DismissableScaffold({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TRANSPARENT,
      appBar: topPadding(),
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    return Dismissible(
      key: Key('key'),
      direction: DismissDirection.down,
      onDismissed: (_) => Routes.pop(context),
      child: TwoColorBackground(
        child: RoundedBodyContent(
          child: SafeArea(
            top: false,
            child: this.child,
          ),
        ),
        startColor: TRANSPARENT,
      ),
    );
  }

  PreferredSize topPadding() {
    return PreferredSize(
      child: Container(),
      preferredSize: Size.fromHeight(100),
    );
  }
}

class RoundedBodyContent extends StatelessWidget {
  final Widget child;
  const RoundedBodyContent({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          primary: false,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Container(
              decoration: roundDecoration(
                color: Theme.of(context).backgroundColor,
                radius: 30,
              ),
              child: this.child,
            ),
          ),
        );
      },
    );
  }
}
