class LabelsAppModel {
  const LabelsAppModel({
    required this.title,
  });

  final String title;

  Map<int, dynamic> toJson() {
    return {
      1: title,
    };
  }
}
