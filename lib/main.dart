import 'package:flutter/material.dart';

void main() {
  runApp(const MiTiendaLala());
}

class MiTiendaLala extends StatelessWidget {
  const MiTiendaLala({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Productos No Lacteos'),
          backgroundColor: Colors.red[700],
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {}, // No funcional
            ),
          ],
        ),
        body: Column(
          children: [
            // --- BARRA DE BÚSQUEDA NO FUNCIONAL ---
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 45, // Barra de búsqueda más delgada
                child: TextField(
                  enabled: false, 
                  decoration: InputDecoration(
                    hintText: 'Buscar productos...',
                    prefixIcon: const Icon(Icons.search, size: 20),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            // --- LISTA DE PRODUCTOS ---
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  itemProducto(
                    'Tocino Lala', 
                    '\$35', 
                    'https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Tocino.jpg'
                  ),
                  itemProducto(
                    'Jugo Lala', 
                    '\$10', 
                    'https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Jugo.jpg'
                  ),
                  itemProducto(
                    'Jamón Lala', 
                    '\$40', 
                    'https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Jamon.jpg'
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemProducto(String nombre, String precio, String urlImagen) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0), // Margen reducido
      child: Column(
        children: [
          // Nombre y Precio más pequeños
          Text(
            nombre,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            precio,
            style: const TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8), // Espacio reducido
          // Imagen con altura reducida
          Image.network(
            urlImagen,
            height: 110, // Antes era 180
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => 
              const Icon(Icons.image, size: 50, color: Colors.grey),
          ),
          const Divider(thickness: 1, height: 25), // Divisor más sutil
        ],
      ),
    );
  }
}