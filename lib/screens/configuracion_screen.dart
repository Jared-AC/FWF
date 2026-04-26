import 'package:flutter/material.dart';
import 'perfildate_screen.dart';


class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            Navigator.pop(context); // Vuelve a la pantalla anterior
          },
        ),
        title: const Text(
          'Configuración',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold, // Hacer el texto en negrita
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1, // Sombra ligera
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Añadir algo de padding general
        child: ListView(
          children: [
            const SizedBox(height: 20), // Separar el título de las opciones
            _buildOptionItem(
              title: 'Mi perfil',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Perfilscreen()),
                );
                // Navega a la pantalla de perfil
              },
            ),
            _buildOptionItem(
              title: 'Acerca de FoodWheels Fast',
              onTap: () {
                // Navega a la pantalla de "Acerca de"
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
            ),
            _buildOptionItem(
              title: 'Cerrar sesión',
              onTap: () {
                // Muestra el cuadro de confirmación
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Fondo blanco
    );
  }

  Widget _buildOptionItem({required String title, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0), // Espaciado entre las opciones
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade100, // Fondo gris claro
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // Text alignado a la izquierda con un padding a la izquierda
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // Mueve el texto hacia la derecha
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis, // Asegurar que el texto no se desborde
                ),
              ),
              // Esto coloca la flecha alineada a la derecha
              const Spacer(), // El Spacer empuja la flecha hacia la derecha
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.orange,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // No se puede cerrar el diálogo tocando fuera de él
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Notificación'),
        content: const Text('¿Estás seguro de cerrar sesión?'),
        backgroundColor: Colors.orange.shade100, // Color de fondo naranja claro
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el diálogo (Cancelar)
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              // Lógica para cerrar sesión
              Navigator.of(context).pop(); // Cierra el diálogo
              // Aquí puedes añadir la lógica para cerrar la sesión del usuario
            },
            child: const Text(
              'Aceptar',
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold), // Resaltar en naranja
            ),
          ),
        ],
      );
    },
  );
}

}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            Navigator.pop(context); // Vuelve a la pantalla anterior
          },
        ),
        title: const Text(
          'Acerca de FoodWheels Fast',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding general
        child: Center( // Alinea todo el contenido al centro de la pantalla
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
            crossAxisAlignment: CrossAxisAlignment.center, // Centra horizontalmente
            children: [
              // Logo de la app (puedes usar cualquier imagen de tu aplicación)
              Image.asset(
                'assets/images/logoFWF.png', // Reemplazar con la ruta de tu logo
                width: 200, // Ajusta el tamaño del logo
                height: 200,
              ),
              const SizedBox(height: 20),
              // Nombre de la app
              const Text(
                'FoodWheels Fast',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Versión de la app
              const Text(
                'Versión: V1.0.0',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white, // Fondo blanco
    );
  }
}
