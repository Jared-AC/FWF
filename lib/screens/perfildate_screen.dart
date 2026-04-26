import 'package:flutter/material.dart';

class Perfilscreen extends StatelessWidget {
  const Perfilscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  
        title: const Text('Mi perfil', style:
         
        TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.orange.shade200,
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () {
                      // Acción para cambiar foto
                    },
                    icon: const Icon(Icons.edit, color: Color(0xFFF38C27)),
                    label: const Text('Cambiar foto de perfil',
                        style: TextStyle(color: Color(0xFFF38C27))),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade300),
            const ProfileSection(title: "Nombre", value: "Carlos"),
            const ProfileSection(title: "Apellido(s)", value: "Aguilar Mendoza"),
            Divider(height: 1, color: Colors.grey.shade300),
            const ProfileSection(title: "Número de Identificación", value: ""),
            const ProfileSection(title: "Fecha de nacimiento", value: "yyy-mm-dd"),
            const ProfileSection(title: "Teléfono", value: "77**6272"),
            const ProfileSection(title: "Contraseña", value: "••••••••"),
            const ProfileSection(title: "Correo electrónico", value: ""),
            Divider(height: 1, color: Colors.grey.shade300),
            ListTile(
              title: const Text(
                "Eliminar cuenta",
                style: TextStyle(color: Colors.red),
              ),
              trailing: const Icon(Icons.delete, color: Colors.red),
              onTap: () {
                // Acción para eliminar cuenta
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String title;
  final String value;

  const ProfileSection({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: value.isNotEmpty
          ? Text(value, style: const TextStyle(color: Colors.grey))
          : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      onTap: () {
        // Acción para editar la sección
      },
    );
  }
}