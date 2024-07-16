import 'package:flutter/material.dart';

class DashboardItemModel {
  final String? svgSrc, title;
  final Icon? icon;

  DashboardItemModel({this.svgSrc, this.title, this.icon});
}

List<DashboardItemModel> dashboardItems(BuildContext context) {
  return [
    DashboardItemModel(
      title: "Hours of Sleep",
      svgSrc: "asset/img_1.png",
    ),
    DashboardItemModel(
      title: "Drink water",
      svgSrc: "asset/img_1.png",
    ),
    DashboardItemModel(
      title: "Exercise",
      svgSrc: "asset/img_4.png",
    ),
    DashboardItemModel(
      title: "Meditate",
      svgSrc: "asset/img_5.png",
    ),
    DashboardItemModel(
      title: "Eat Healthy",
      svgSrc: "asset/img_5.png",
    ),
    DashboardItemModel(
      title: "Work",
      svgSrc: "asset/img_6.png",
    ),
    DashboardItemModel(
      title: "Read a Book",
      svgSrc: "asset/img_7.png",
    ),
    DashboardItemModel(
      title: "Early Bed",
      svgSrc: "asset/img_8.png",
    ),

  ];
}
