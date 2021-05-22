class LabelsHomeModel {
  const LabelsHomeModel({
    required this.title,
    required this.name,
    required this.email,
  });

  final String title;
  final String name;
  final String email;

  Map<int, dynamic> toJson() {
    return {
      1: title,
      2: name,
      3: email,
    };
  }
}
