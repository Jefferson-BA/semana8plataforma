import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/registro_screen.dart';
import 'screens/listado_screen.dart';
import 'screens/perfil_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos un color semilla vibrante y moderno
    final Color seedColor = const Color(0xFF2979FF); // Un azul acento muy moderno y limpio

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moderna App de Gestión',
      // Tema Claro (por defecto, para continuidad)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.light),
        useMaterial3: true,
      ),
      // NUEVO: Tema Oscuro Moderno y Bonito
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
          // Ajustes finos para el tema oscuro
          primary: const Color(0xFF64B5F6), // Un azul más claro para el acento primario
          background: const Color(0xFF121212), // Gris de fondo muy profundo
          surface: const Color(0xFF1E1E1E), // Gris de tarjeta para elevación sutil
          onBackground: const Color(0xFFEEEEEE), // Texto blanco/gris muy claro
          onSurface: const Color(0xFFEEEEEE),
        ),
        useMaterial3: true,
        // Tipografía moderna
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFFEEEEEE)),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFFEEEEEE)),
          headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFFEEEEEE)),
          bodyLarge: TextStyle(fontSize: 16, color: Color(0xFFEEEEEE)),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFFEEEEEE)),
        ),
        // Estilo global para AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          foregroundColor: Color(0xFFEEEEEE),
          elevation: 0, // Sin sombra para un look limpio
          centerTitle: true,
        ),
        // Modernizar campos de entrada
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade700),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: const Color(0xFF64B5F6), width: 2),
          ),
          filled: true,
          fillColor: const Color(0xFF1E1E1E),
          labelStyle: TextStyle(color: Colors.grey.shade400),
          prefixIconColor: const Color(0xFF64B5F6),
          suffixIconColor: const Color(0xFF64B5F6),
        ),
        // Estilo moderno para botones principales
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF64B5F6),
            foregroundColor: const Color(0xFF121212), // Texto oscuro sobre fondo claro
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),

        cardTheme: CardThemeData( 
          color: const Color(0xFF1E1E1E),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Color(0xFF64B5F6),
          textColor: Color(0xFFEEEEEE),
        ),
      ),
      themeMode: ThemeMode.dark, // Forzamos el modo oscuro
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/menu': (context) => const MenuScreen(),
        '/registro': (context) => const RegistroScreen(),
        '/listado': (context) => const ListadoScreen(),
        '/perfil': (context) => const PerfilScreen(),
      },
    );
  }
}