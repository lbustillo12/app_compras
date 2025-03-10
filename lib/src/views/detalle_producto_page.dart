import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetalleProductoPage extends StatelessWidget {
  const DetalleProductoPage({super.key, required this.id, this.extras});

  final String id;
  final Map? extras;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalle del producto',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 238, 235, 235),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 135, 88, 216),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del producto
              Center(
                child: CachedNetworkImage(
                  imageUrl: extras?['image'] ?? '',
                  placeholder:
                      (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Título del producto
              Text(
                extras?['title'] ?? 'Sin título',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Precio del producto
              Text(
                'USD ${extras?['price'] ?? '0.00'}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),

              // Descripción del producto
              const Text(
                'Descripción:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                extras?['description'] ?? 'Sin descripción',
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 116, 116, 116),
                ),
              ),
              const SizedBox(height: 20),

              // Categoría del producto
              const Text(
                'Categoría:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                extras?['category'] ?? 'Sin categoría',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 116, 116, 116),
                ),
              ),
              const SizedBox(height: 20),

              // Valoración del producto
              const Text(
                'Valoración:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 5),
                  Text(
                    '${extras?['rating']['rate'] ?? '0.0'}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '(${extras?['rating']['count'] ?? '0'} reseñas)',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 116, 116, 116),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
