import 'package:flutter/material.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('REGISTRO DE PRODUCTOS')),
      body: SingleChildScrollView( // Permite hacer scroll si el teclado tapa los campos
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(decoration: InputDecoration(labelText: 'Nombre del producto')),
            const SizedBox(height: 15),
            const TextField(decoration: InputDecoration(labelText: 'Precio')),
            const SizedBox(height: 15),
            const TextField(decoration: InputDecoration(labelText: 'Categoría')),
            const SizedBox(height: 15),
            const TextField(decoration: InputDecoration(labelText: 'Stock disponible')),
            const SizedBox(height: 15),
            const TextField(decoration: InputDecoration(labelText: 'Proveedor o Marca')),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                // Solo UI, vuelve atrás al presionar guardar simulando el éxito
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Producto guardado (Simulación)')),
                );
                Navigator.pop(context);
              },
              child: const Text(
                'GUARDAR',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}