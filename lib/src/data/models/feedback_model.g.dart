// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) =>
    FeedbackModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      petName: json['petName'] as String,
      rating: (json['rating'] as num).toInt(),
      comments: json['comments'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$FeedbackModelToJson(FeedbackModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'petName': instance.petName,
      'rating': instance.rating,
      'comments': instance.comments,
      'timestamp': instance.timestamp.toIso8601String(),
    };
