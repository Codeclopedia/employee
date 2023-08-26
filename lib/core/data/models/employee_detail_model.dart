import 'dart:convert';

class EmployeeDetails {
  int? id;
  String? name;
  String? role;
  DateTime? startingDate;
  DateTime? endingDate;

  EmployeeDetails({
    this.id,
    this.name,
    this.role,
    this.startingDate,
    this.endingDate,
  });

  factory EmployeeDetails.fromRawJson(String str) =>
      EmployeeDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EmployeeDetails.fromJson(Map<String, dynamic> json) =>
      EmployeeDetails(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        startingDate: DateTime.parse(json["starting_date"]),
        endingDate: DateTime.parse(json["ending_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "starting_date": startingDate?.toIso8601String(),
        "ending_date": endingDate?.toIso8601String(),
      };
}
