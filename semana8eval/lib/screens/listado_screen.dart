import 'package:flutter/material.dart';

class ListadoScreen extends StatelessWidget {
  const ListadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> productos = List.generate(20, (index) => 'Producto # ${index + 1}');

    return Scaffold(
      appBar: AppBar(title: const Text('INVENTARIO')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: productos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.inventory_2_outlined, color: Theme.of(context).colorScheme.primary),
              ),
              title: Text(productos[index], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Última actualización: Hoy', style: TextStyle(color: Colors.grey)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}