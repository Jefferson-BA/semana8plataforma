import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MENU'),
        automaticallyImplyLeading: false, // Oculta la flecha de atrás
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Listado de Productos', style: TextStyle(fontSize: 18)),
            onTap: () => Navigator.pushNamed(context, '/listado'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Registrar Producto', style: TextStyle(fontSize: 18)),
            onTap: () => Navigator.pushNamed(context, '/registro'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile', style: TextStyle(fontSize: 18)),
            onTap: () => Navigator.pushNamed(context, '/perfil'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text('Logout', style: TextStyle(fontSize: 18, color: Colors.red)),
            onTap: () {
              // Navega al login y destruye las rutas anteriores (Logout real)
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}