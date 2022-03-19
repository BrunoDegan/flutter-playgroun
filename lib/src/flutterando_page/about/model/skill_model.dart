class SkillsModel {
  final String title;
  final int percentage;

  SkillsModel({required this.title, required this.percentage});

  factory SkillsModel.fromJson(Map<String, dynamic> json) {
    return SkillsModel(
      title: json['title'],
      percentage: json['percentage'],
    );
  }

  Map<String, dynamic> toJson() => {'title': title, 'percentage': percentage};
}
