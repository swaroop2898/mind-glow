
import 'package:hive/hive.dart';
part 'helpdesk.g.dart';

@HiveType(typeId: 1)
class HelpDesk {
  @HiveField(0)
  String status;
  @HiveField(1)
  List<HelpDeskElement> helpDesk;

  HelpDesk({
    required this.status,
    required this.helpDesk,
  });

  factory HelpDesk.fromJson(Map<String, dynamic> json) => HelpDesk(
        status: json["status"],
        helpDesk: List<HelpDeskElement>.from(
            json["HelpDesk"].map((x) => HelpDeskElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "HelpDesk": List<dynamic>.from(helpDesk.map((x) => x.toJson())),
      };
}
@HiveType(typeId: 2)
class HelpDeskElement {
  @HiveField(0)
  String locId;
  @HiveField(1)
  String locationName;
  @HiveField(2)
  String locationUrl;

  HelpDeskElement({
    required this.locId,
    required this.locationName,
    required this.locationUrl,
  });

  factory HelpDeskElement.fromJson(Map<String, dynamic> json) =>
      HelpDeskElement(
        locId: json["loc_id"],
        locationName: json["location_name"],
        locationUrl: json["location_url"],
      );

  Map<String, dynamic> toJson() => {
        "loc_id": locId,
        "location_name": locationName,
        "location_url": locationUrl,
      };
}

