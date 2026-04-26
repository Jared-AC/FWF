import 'package:flutter/material.dart';
import 'perfil_screen.dart';
import 'pedido_screens.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.location_on, color: Color(0xFFF38C27)),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                "Tezontepec de Aldama, Hgo",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, size: 30, color: Color(0xFFF38C27)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar platillos...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFF6F6F6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = screenWidth > 600 ? 4 : 3;
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      _buildCategoryIcon(Icons.local_pizza, "Pizzas"),
                      _buildCategoryIcon(Icons.fastfood, "Hamburguesas"),
                      _buildCategoryIcon(Icons.local_drink, "Bebidas"),
                      _buildCategoryIcon(Icons.store, "Del barrio"),
                      _buildCategoryIcon(Icons.cake, "Postres"),
                      _buildCategoryIcon(Icons.more_horiz, "Ver más"),
                    ],
                  );
                },
              ),
            ),
            // Promotions Title
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Promociones",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              color: Color(0xFFF38C27),
              thickness: 2,
              indent: 16,
              endIndent: 16,
            ),
            // Promotions Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = screenWidth > 600 ? 3 : 2;
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildPromotionCard(
                          "Torta campechana", 80, 60, "assets/images/1-tacos.jpg"),
                      _buildPromotionCard(
                          "Torta campechana", 80, 60, "assets/images/1-tacos.jpg"),
                      _buildPromotionCard(
                          "Torta campechana", 80, 60, "assets/images/1-tacos.jpg"),
                      _buildPromotionCard(
                          "Torta campechana", 80, 60, "assets/images/1-tacos.jpg"),
                          
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
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
  if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PerfilScreen()),
    );
  } else if (index == 0) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Pedidoscreen()),
    );
  }
},

    ),);
  }

  Widget _buildCategoryIcon(IconData icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color(0xFFFDF1E7),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 35, color: const Color(0xFFF38C27)),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildPromotionCard(
      String title, double price, double discount, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity, // Asegura que la imagen sea responsiva
                height: 10, // Establece un alto fijo
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover, // Ajusta la imagen para que cubra el contenedor
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (discount > 0)
              Text(
                "MX\$${discount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            Text(
              "MX\$${price.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF38C27),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF38C27),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
