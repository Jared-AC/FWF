import 'package:flutter/material.dart';
import 'configuracion_screen.dart';
import 'perfildate_screen.dart';
import 'home_screen.dart';
import 'perfil_screen.dart';

class Pedidoscreen extends StatelessWidget {
  const Pedidoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Mis Pedidos',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PedidoCard(
            title: "Antojitos Ortiz",
            status: "Cerrado",
            statusColor: Colors.red,
            openingTime: "Abre a las 6:30 PM",
            items: ["Sope de pollo", "Quesadilla"],
            date: "04/11/2024 5:00 PM",
            total: 100.00,
          ),
          PedidoCard(
            title: "Tacos El centro",
            status: "Abierto",
            statusColor: Colors.green,
            openingTime: "",
            items: ["Torta campechana", "Tacos"],
            date: "04/11/2024 6:00 PM",
            total: 80.00,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFFF38C27),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          
  }
        },
      ),
    );
  }
}

class PedidoCard extends StatelessWidget {
  final String title;
  final String status;
  final Color statusColor;
  final String openingTime;
  final List<String> items;
  final String date;
  final double total;

  const PedidoCard({super.key, 
    required this.title,
    required this.status,
    required this.statusColor,
    required this.openingTime,
    required this.items,
    required this.date,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            if (openingTime.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  openingTime,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            const Divider(height: 20),
            ...items
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: [
                        Expanded(child: Text(item)),
                        Icon(Icons.image, color: Colors.grey.shade400),
                      ],
                    ),
                  ),
                )
                ,
            GestureDetector(
              onTap: () {
                // Acción para ver más elementos
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Ver todos(${items.length})",
                  style: const TextStyle(
                    color: Color(0xFFF38C27),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "MX\$${total.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF38C27),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}