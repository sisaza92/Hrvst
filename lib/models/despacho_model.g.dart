// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despacho_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Despacho _$DespachoFromJson(Map<String, dynamic> json) => Despacho(
      id: json['id'] as int,
      placa: json['placa'] as String,
      conductor: json['conductor'] as String,
      fecha: DateTime.parse(json['fecha'] as String),
    );

Map<String, dynamic> _$DespachoToJson(Despacho instance) => <String, dynamic>{
      'id': instance.id,
      'placa': instance.placa,
      'conductor': instance.conductor,
      'fecha': instance.fecha.toIso8601String(),
    };
