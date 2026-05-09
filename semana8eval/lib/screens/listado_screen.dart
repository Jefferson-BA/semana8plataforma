import 'package:flutter/material.dart';

class ListadoScreen extends StatelessWidget {
  const ListadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista simulada de datos (Solo UI)
    final List<String> productos = List.generate(15, (index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: AppBar(title: const Text('ListView - Items')),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.inventory_2),
            title: Text(productos[index]),
            subtitle: const Text('Descripción simulada del item'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          );
        },
      ),
    );
  }
}