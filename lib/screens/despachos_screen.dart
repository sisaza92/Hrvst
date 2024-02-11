import 'package:flutter/material.dart';
import 'package:myapp/api/despacho_api_client.dart';
import 'package:myapp/models/despacho_model.dart';

class DespachosScreen extends StatefulWidget {
  final DespachoApiClient apiClient;

  DespachosScreen({required this.apiClient});

  @override
  _DespachosScreenState createState() => _DespachosScreenState();
}

class _DespachosScreenState extends State<DespachosScreen> {
  late List<Despacho> despachos;
  final TextEditingController placaController = TextEditingController();
  final TextEditingController conductorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    despachos = [];
    _cargarDespachos();
  }

  Future<void> _cargarDespachos() async {
    final nuevosDespachos = await widget.apiClient.getAllDespachos(1, 10);
    setState(() {
      despachos = nuevosDespachos;
    });
  }

  Future<void> _crearDespacho() async {
    final nuevoDespacho = Despacho(
      id: 0,
      placa: placaController.text,
      conductor: conductorController.text,
      fecha: DateTime.now(),
    );

    final despachoCreado = await widget.apiClient.crearDespacho(nuevoDespacho);
    setState(() {
      despachos.add(despachoCreado);
    });

    // Limpiar los campos después de crear el despacho
    placaController.clear();
    conductorController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despachos'),
        ),
        body: Column(children: [
          // Lista de Despachos
          Expanded(
            child: ListView.builder(
              itemCount: despachos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Placa: ${despachos[index].placa}'),
                  subtitle: Text('Conductor: ${despachos[index].conductor}'),
                );
              },
            ),
          ),
          // Formulario para Crear Despacho
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: placaController,
                    decoration: InputDecoration(labelText: 'Placa'),
                  ),
                  TextField(
                    controller: conductorController,
                    decoration: InputDecoration(labelText: 'Conductor'),
                  ),
                  ElevatedButton(
                    onPressed: _crearDespacho,
                    child: Text('Crear Despacho'),
                  ),
                ],
              ))
        ]));
  }
}
