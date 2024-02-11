import 'package:json_annotation/json_annotation.dart';

part 'despacho_model.g.dart';

@JsonSerializable()
class Despacho {
  final int id;
  final String placa;
  final String conductor;
  final DateTime fecha;

  Despacho({
    required this.id,
    required this.placa,
    required this.conductor,
    required this.fecha,
  });

  factory Despacho.fromJson(Map<String, dynamic> json) =>
      _$DespachoFromJson(json);

  Map<String, dynamic> toJson() => _$DespachoToJson(this);
}
