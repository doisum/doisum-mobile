import 'package:flutter/material.dart';
import 'package:healthy_routine_mobile/healthy_routine.dart';
import 'package:healthy_routine_mobile/presentation/components/page_header.dart';

class DailyTaskListPage extends StatelessWidget {
  const DailyTaskListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return TaskCard();
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: GREEN,
      expandedHeight: 150.0,
      shape: ROUNDED_HEADER_SHAPE,
      bottom: PreferredSize(
        child: PageHeader(),
        preferredSize: Size.square(80),
      ),
    );
  }
}
