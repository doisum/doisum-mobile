import 'package:flutter/widgets.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: GREEN),
      child: SizedBox(
        height: 300,
      ),
    );
  }
}
