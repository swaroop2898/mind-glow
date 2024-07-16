import 'package:flutter/material.dart';

import '../../Model/dashboard_item_model.dart';
import '../../core/widgets/common_widgets.dart';
import '../view/HoursOfSleepView.dart';


class DashboardItemCard extends StatefulWidget {
  const DashboardItemCard({
    super.key,
    required this.dashboardItemModel,
  });

  final DashboardItemModel dashboardItemModel;

  @override
  _DashboardItemCardState createState() => _DashboardItemCardState();
}

class _DashboardItemCardState extends State<DashboardItemCard> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked = !_isClicked;
        });
        switch (widget.dashboardItemModel.title) {
          case "Hours of Sleep":
            GlobalWidgets.navigatePushToNextScreen(
              context: context,
              widget: const HoursOfSleepView(),
            );
            break;

          case "Drink water":
            GlobalWidgets.navigatePushToNextScreen(
              context: context,
              widget: const HoursOfSleepView(),
            );
            break;
          case "Exercise":
            GlobalWidgets.navigatePushToNextScreen(
              context: context,
              widget: const HoursOfSleepView(),
            );
            break;
          case "Meditate":
            GlobalWidgets.navigatePushToNextScreen(
              context: context,
              widget: const HoursOfSleepView(),
            );
            break;

          default:
            // GlobalWidgets.navigatePushToNextScreen(
            //     context: context, widget: const DashboardScreen());
            break;
        }
      },
      child: Card(
        semanticContainer: true,
        surfaceTintColor: Colors.white,
        borderOnForeground: true,
        shadowColor: Colors.purple.shade500,
        elevation: 8,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.purple.shade100,
              strokeAlign: BorderSide.strokeAlignOutside,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                //  padding: const EdgeInsets.all(defaultPadding * 0.75),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: Colors.purple.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.shade500,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: widget.dashboardItemModel.icon ??
                    Image.asset(
                      widget.dashboardItemModel.svgSrc!,
                      // height: 40,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: textWidget(
                    title: widget.dashboardItemModel.title!,
                    color: Colors.purple,
                    maxLines: 2,
                    fontWeight: FontWeight.w900,
                    fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
