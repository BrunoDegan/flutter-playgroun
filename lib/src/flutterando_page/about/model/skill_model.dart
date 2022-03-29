import 'package:equatable/equatable.dart';

class SkillsModel extends Equatable {
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

  @override
  List<Object> get props => [title, percentage];

  @override
  bool? get stringify => false;
}
