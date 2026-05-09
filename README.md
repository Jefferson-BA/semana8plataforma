# Flutter Dark Theme — Documentación por Pantalla

> Material 3 · Tema oscuro moderno · 6 pantallas

---

## Tabla de contenidos

- [Estructura del proyecto](#estructura-del-proyecto)
- [Configuración del tema — main.dart](#configuración-del-tema--maindart)
- [Pantalla 1 — Login](#pantalla-1--login)
- [Pantalla 2 — Menú / Panel de Control](#pantalla-2--menú--panel-de-control)
- [Pantalla 3 — Registro de Producto](#pantalla-3--registro-de-producto)
- [Pantalla 4 — Listado / Inventario](#pantalla-4--listado--inventario)
- [Pantalla 5 — Perfil](#pantalla-5--perfil)
- [Cómo ejecutar](#cómo-ejecutar)

---

## Estructura del proyecto

```
lib/
├── main.dart                  # Configuración global del tema
└── screens/
    ├── login_screen.dart      # Pantalla de inicio de sesión
    ├── menu_screen.dart       # Panel de control / menú principal
    ├── registro_screen.dart   # Formulario de nuevo producto
    ├── listado_screen.dart    # Lista de productos (inventario)
    └── perfil_screen.dart     # Perfil del usuario
```

---

## Configuración del tema — `main.dart`

El tema oscuro se define una sola vez aquí y se hereda en toda la app.

### Paleta de colores

| Color | Hex | Uso |
|-------|-----|-----|
| Background | `#121212` | Fondo principal (gris profundo, no negro puro) |
| Surface | `#1E1E1E` | Fondo de tarjetas y campos de texto |
| Primary | `#64B5F6` | Azul acento, iconos y bordes activos |
| SeedColor | `#2979FF` | Semilla del `ColorScheme` de Material 3 |
| onBackground | `#EEEEEE` | Texto principal claro |

### Propiedades clave del `ThemeData`

```dart
darkTheme: ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFF2979FF),
    brightness: Brightness.dark,
    primary: Color(0xFF64B5F6),
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF121212),
    elevation: 0,          // sin sombra — look limpio
    centerTitle: true,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF1E1E1E),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFF64B5F6), width: 2),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF64B5F6),
      foregroundColor: Color(0xFF121212), // texto oscuro sobre botón azul
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  cardTheme: CardTheme(
    color: Color(0xFF1E1E1E),
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
),
themeMode: ThemeMode.dark, // fuerza el tema oscuro siempre
```

> **Regla de oro:** nunca uses colores hardcodeados en los widgets.
> Siempre usa `Theme.of(context).colorScheme.primary` para mantener consistencia.

---

## Pantalla 1 — Login

**Archivo:** `lib/screens/login_screen.dart`

Formulario de inicio de sesión centrado en una tarjeta con campos modernos e iconos.

### Estructura

```
Scaffold
└── Padding(40)
    └── Center
        └── ConstrainedBox(maxWidth: 400)   ← limita ancho en tablets/web
            └── Card
                └── Padding(30)
                    └── Column
                        ├── Text "INICIAR SESIÓN"
                        ├── TextField (email)
                        ├── TextField (password, obscureText: true)
                        └── ElevatedButton → /menu
```

### Puntos clave

| Widget | Detalle |
|--------|---------|
| `ConstrainedBox(maxWidth: 400)` | Evita que el form se estire en pantallas anchas |
| `TextField` email | `prefixIcon: Icons.email_outlined`, `keyboardType: emailAddress` |
| `TextField` password | `obscureText: true`, `prefixIcon: Icons.lock_outline` |
| `ElevatedButton` | `Navigator.pushReplacementNamed(context, '/menu')` |
| `MainAxisSize.min` | La tarjeta se ajusta al contenido, no ocupa toda la pantalla |

> ⚠️ **Pendiente:** no valida campos, no muestra errores, no tiene "Olvidé mi contraseña".

---

## Pantalla 2 — Menú / Panel de Control

**Archivo:** `lib/screens/menu_screen.dart`

Menú principal con opciones en tarjetas individuales. El logout está diferenciado en rojo.

### Estructura

```
Scaffold
└── AppBar("PANEL DE CONTROL", automaticallyImplyLeading: false)
└── SingleChildScrollView > Column
    ├── _MenuCard → /registro
    ├── _MenuCard → /listado
    ├── _MenuCard → /perfil
    └── _MenuCard (isLogout: true) → /login
```

### Widget auxiliar `_MenuCard`

```dart
Card
└── ListTile(contentPadding: EdgeInsets.all(20))
    ├── leading: Container(
    │     padding: 12,
    │     decoration: fondo primary.withOpacity(0.1), radius 12
    │     child: Icon(icon, size: 28)
    │   )
    ├── title: Text(title, fontSize: 18, fontWeight: w600)
    └── trailing: Icon(Icons.arrow_forward_ios, size: 18)
```

### Navegación

```dart
// Navegar a una pantalla
Navigator.pushNamed(context, '/registro');

// Logout — borra toda la pila, no permite volver con "atrás"
Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
```

> `isLogout: true` activa fondo rojo con `withOpacity(0.2)` e icono `redAccent`.

---

## Pantalla 3 — Registro de Producto

**Archivo:** `lib/screens/registro_screen.dart`

Formulario de 5 campos. Todos los inputs heredan el estilo global del `InputDecorationTheme`.

### Campos

| Campo | Icono | Tipo de teclado |
|-------|-------|-----------------|
| Nombre del Producto | `Icons.label_outline` | texto |
| Precio (S/.) | `Icons.attach_money` | `number` |
| Categoría | `Icons.category_outlined` | texto |
| Stock Disponible | `Icons.inventory_2_outlined` | `number` |
| Marca / Proveedor | `Icons.business_outlined` | texto |

### Estructura

```
Scaffold
└── AppBar("NUEVO PRODUCTO")
└── SingleChildScrollView           ← evita overflow con el teclado abierto
    └── Column(crossAxisAlignment: stretch)
        ├── TextField x5
        ├── SizedBox(height: 50)    ← separación visual antes del botón
        └── ElevatedButton
            ├── ScaffoldMessenger.showSnackBar(...)
            └── Navigator.pop(context)
```

> `keyboardType: TextInputType.number` en precio y stock abre el teclado numérico en móvil.

---

## Pantalla 4 — Listado / Inventario

**Archivo:** `lib/screens/listado_screen.dart`

Lista de productos generada dinámicamente. Cada item es una tarjeta con ícono, título y subtítulo.

### Estructura

```
Scaffold
└── AppBar("INVENTARIO")
└── ListView.builder(padding: EdgeInsets.all(16))
    └── Card(margin: only(bottom: 16))
        └── ListTile(contentPadding: EdgeInsets.all(16))
            ├── leading: Container(fondo acento, radius 12)
            │   └── Icon(Icons.inventory_2_outlined)
            ├── title: Text(bold)
            ├── subtitle: Text("Última actualización: Hoy", Colors.grey)
            └── trailing: Icon(Icons.arrow_forward_ios, size: 16)
```

### Puntos clave

| Elemento | Por qué importa |
|----------|-----------------|
| `ListView.builder` | Renderiza solo los items visibles — obligatorio para listas largas |
| `List.generate(20, ...)` | Datos simulados — reemplazar con llamada a API o DB |
| `padding: EdgeInsets.all(16)` | Las tarjetas no tocan los bordes de pantalla |
| Leading con fondo de color | Da identidad visual sin necesidad de imágenes |

> ❌ Nunca uses `ListView` normal para listas dinámicas — renderiza todos los items a la vez.

---

## Pantalla 5 — Perfil

**Archivo:** `lib/screens/perfil_screen.dart`

Pantalla de perfil con avatar destacado, nombre, email y datos personales en una tarjeta ordenada.

### Estructura

```
Scaffold
└── AppBar("MI PERFIL")
└── SingleChildScrollView > Column
    ├── Container(border acento, shape: circle)   ← borde de color en el avatar
    │   └── CircleAvatar(radius: 60)
    │       └── Icon(Icons.person_outline, size: 70)
    ├── Text(nombre)     → textTheme.headlineMedium
    ├── Text(email)      → Colors.grey.shade400
    └── Card
        └── Padding(25)
            └── Column
                ├── Text("Datos Personales")
                └── _PerfilField x4
```

### Widget auxiliar `_PerfilField`

```dart
Row
├── Icon(icon, color: colorScheme.primary, size: 22)
├── SizedBox(width: 15)
├── Expanded
│   └── Column
│       ├── Text(label, fontSize: 13, color: grey)   ← etiqueta pequeña
│       └── Text(value, fontSize: 16, w500)           ← dato principal
└── Icon(Icons.edit_outlined, color: grey, size: 18)  ← solo visual, no funcional
```

### Puntos clave

- El `Container` con `Border.all` alrededor del avatar lo hace destacar sobre el fondo
- Separar `label` y `value` en columna es más legible que un texto tipo `"Nombre: Juan"`
- `SizedBox(height: 50)` antes del `Card` crea separación visual clara entre avatar y datos
- Para modo edición: reemplazar `Text(value)` por `TextField` + `setState`

---

## Cómo ejecutar

```bash
# Verificar dispositivos conectados
flutter devices

# Ejecutar la app
flutter run

# Build de producción (APK)
flutter build apk --release

# Build para iOS
flutter build ios --release
```

### Rutas registradas en `main.dart`

| Ruta | Pantalla |
|------|----------|
| `/login` | `LoginScreen` |
| `/menu` | `MenuScreen` |
| `/registro` | `RegistroScreen` |
| `/listado` | `ListadoScreen` |
| `/perfil` | `PerfilScreen` |

---

*Flutter · Material 3 · ThemeMode.dark · 2025*