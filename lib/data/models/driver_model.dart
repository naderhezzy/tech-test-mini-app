class DriverModel {
  final String fullName;
  final String team;
  final int position;

  DriverModel({
    required this.fullName,
    required this.team,
    required this.position,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      fullName: json['fullName'],
      team: json['team'],
      position: json['position'],
    );
  }
}
