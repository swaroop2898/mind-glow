import 'package:flutter/material.dart';

import '../../Model/dashboard_item_model.dart';
import '../../core/widgets/common_widgets.dart';
import '../../core/widgets/responsive.dart';
import 'dashboard_item_card.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildHeaderText(context),
            ),
            const SizedBox(
              height: 10,
            ),
            Responsive(
              mobile: DashboardItemGridView(
                crossAxisCount: size.width < 650 ? 2 : 4,
                childAspectRatio: size.width < 650 && size.width > 350 ? 1.3 : 1,
              ),
              tablet: const DashboardItemGridView(),
              desktop: DashboardItemGridView(
                childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildHeaderText(BuildContext context) {
  return textWidget(title: "Start with small step", color: Colors.purple);
}

class DashboardItemGridView extends StatelessWidget {
  const DashboardItemGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: dashboardItems(context).length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          DashboardItemCard(dashboardItemModel: dashboardItems(context)[index]),
    );
  }
}
