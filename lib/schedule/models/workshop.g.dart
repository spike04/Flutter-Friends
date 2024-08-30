// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workshop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workshop _$WorkshopFromJson(Map<String, dynamic> json) => Workshop(
      name: json['name'] as String,
      speakers: (json['speakers'] as List<dynamic>)
          .map((e) => Speaker.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      startTime: DateTime.parse(json['startTime'] as String),
      description: json['description'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkshopToJson(Workshop instance) => <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration.inMicroseconds,
      'startTime': instance.startTime.toIso8601String(),
      'location': instance.location,
      'speakers': instance.speakers,
      'description': instance.description,
    };
