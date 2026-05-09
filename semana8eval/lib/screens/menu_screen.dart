import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PANEL DE CONTROL'), // Título más profesional
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Opciones Disponibles',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 30),
            _MenuCard(
              icon: Icons.add_box_outlined,
              title: 'Registrar Producto',
              onTap: () => Navigator.pushNamed(context, '/registro'),
            ),
            _MenuCard(
              icon: Icons.list_alt_outlined,
              title: 'Listado de Productos',
              onTap: () => Navigator.pushNamed(context, '/listado'),
            ),
            _MenuCard(
              icon: Icons.person_outline,
              title: 'Mi Perfil',
              onTap: () => Navigator.pushNamed(context, '/perfil'),
            ),
            const SizedBox(height: 30), // Espacio antes del logout
            _MenuCard(
              icon: Icons.exit_to_app,
              title: 'Cerrar Sesión',
              isLogout: true,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Un widget auxiliar para las tarjetas de menú
class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.all(20),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isLogout ? Colors.red.withOpacity(0.2) : Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: isLogout ? Colors.redAccent : Theme.of(context).colorScheme.primary,
            size: 28,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isLogout ? Colors.redAccent : Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}