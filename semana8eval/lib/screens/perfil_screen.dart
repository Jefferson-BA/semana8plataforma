import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MI PERFIL')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Mejorar CircleAvatar
            Container(
              padding: const EdgeInsets.all(4), // Borde exterior
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).colorScheme.primary, width: 3),
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xFF1E1E1E), // Gris de tarjeta
                child: Icon(Icons.person_outline, size: 70, color: Color(0xFF64B5F6)),
              ),
            ),
            const SizedBox(height: 15),
            Text('Jefferson Bautista', style: Theme.of(context).textTheme.headlineMedium),
            Text('jefferson.bautista@empresa.com', style: TextStyle(color: Colors.grey.shade400)),
            const SizedBox(height: 50),
            // Bloque de datos en una tarjeta
            Card(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Datos Personales', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 30),
                    const _PerfilField(icon: Icons.person_outline, label: 'Nombre', value: 'Jefferson'),
                    const SizedBox(height: 20),
                    const _PerfilField(icon: Icons.person_outline, label: 'Apellido', value: 'Bautista'),
                    const SizedBox(height: 20),
                    const _PerfilField(icon: Icons.calendar_today_outlined, label: 'Fecha de Nacimiento', value: '07/11/2004'),
                    const SizedBox(height: 20),
                    const _PerfilField(icon: Icons.location_on_outlined, label: 'Ciudad', value: 'Lima, Perú'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget auxiliar para los campos de perfil (con icono)
class _PerfilField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _PerfilField({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 22),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
              Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        const Icon(Icons.edit_outlined, color: Colors.grey, size: 18), // Icono de edición (no funcional)
      ],
    );
  }
}