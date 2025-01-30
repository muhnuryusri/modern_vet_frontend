import 'package:json_annotation/json_annotation.dart';

part 'feedback_request.g.dart';

@JsonSerializable()
class FeedbackRequest {
  final String name;
  final String petName;
  final int rating;
  final String? comments;

  FeedbackRequest({
    required this.name,
    required this.petName,
    required this.rating,
    this.comments,
  });

  factory FeedbackRequest.fromJson(Map<String, dynamic> json) =>
      _$FeedbackRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackRequestToJson(this);
}
