import 'package:json_annotation/json_annotation.dart';

part 'feedback_model.g.dart';

@JsonSerializable()
class FeedbackModel {
  final int id;
  final String name;
  final String petName;
  final int rating;
  final String? comments;
  final DateTime timestamp;

  FeedbackModel({
    required this.id,
    required this.name,
    required this.petName,
    required this.rating,
    this.comments,
    required this.timestamp,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackModelToJson(this);
}
