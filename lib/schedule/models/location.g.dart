// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String,
      coordinates: _$recordConvert(
        json['coordinates'],
        ($jsonValue) => (
          ($jsonValue[r'$1'] as num).toDouble(),
          ($jsonValue[r'$2'] as num).toDouble(),
        ),
      ),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'coordinates': <String, dynamic>{
        r'$1': instance.coordinates.$1,
        r'$2': instance.coordinates.$2,
      },
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
