// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackRequest _$FeedbackRequestFromJson(Map<String, dynamic> json) =>
    FeedbackRequest(
      name: json['name'] as String,
      petName: json['petName'] as String,
      rating: (json['rating'] as num).toInt(),
      comments: json['comments'] as String?,
    );

Map<String, dynamic> _$FeedbackRequestToJson(FeedbackRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'petName': instance.petName,
      'rating': instance.rating,
      'comments': instance.comments,
    };
