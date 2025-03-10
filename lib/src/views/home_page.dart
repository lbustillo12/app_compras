import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:app_compras/src/api/productos.dart';
import 'package:app_compras/src/widgets/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<String> _categories = [
    'Todos',
    "Men's Clothing",
    'Jewelery',
    'Electronics',
    "Women's Clothing",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 238, 235, 235),
        ),
        title: const Text('Reddit'),
        backgroundColor: Color.fromARGB(255, 135, 88, 216),
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 238, 235, 235),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawer: const SideMenu(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _buildProductsPage(), // Página de Productos"
          _buildFavoritesPage(), // Página de favoritos
          _buildProfilePage(), // Página de perfil
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        selectedItemColor: Color.fromARGB(255, 135, 88, 216),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  Widget _buildProductsPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '',
              style: TextStyle(
                fontSize: 2,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 135, 88, 216),
              ),
            ),
          ),

          // Lista horizontal de categorías
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(_categories[index]),
                    selected: _selectedCategoryIndex == index,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    selectedColor: Color.fromARGB(
                      255,
                      135,
                      88,
                      216,
                    ), // Color del chip seleccionado
                    labelStyle: TextStyle(
                      color:
                          _selectedCategoryIndex == index
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),

          // Lista de productos en formato de cuadrícula
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: _filtrarProductosPorCategoria().length,
              itemBuilder: (context, index) {
                final producto = _filtrarProductosPorCategoria()[index];
                return ItemGrid(producto: producto);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir la página de favoritos
  Widget _buildFavoritesPage() {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mis Favoritos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 135, 88, 216),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final producto = productos[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: producto['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      producto['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'USD ${producto['price']}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.favorite, color: Colors.red),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir la página de perfil
  Widget _buildProfilePage() {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Lizy Bustillo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 135, 88, 216),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'lizy.bustillo@unah.hn',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 135, 88, 216),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Editar Perfil',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para filtrar productos por categoría
  List<Map<String, dynamic>> _filtrarProductosPorCategoria() {
    if (_selectedCategoryIndex == 0) {
      return productos;
    } else {
      final categoriaSeleccionada = _categories[_selectedCategoryIndex];
      return productos
          .where(
            (producto) =>
                producto['category'].toLowerCase() ==
                categoriaSeleccionada.toLowerCase(),
          )
          .toList();
    }
  }
}

// Widged de productos en formato de cuadrícula
class ItemGrid extends StatelessWidget {
  final Map<String, dynamic> producto;

  const ItemGrid({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Sombra
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          context.goNamed(
            'detalle-producto',
            pathParameters: {'productoId': producto['id'].toString()},
            extra: producto,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: producto['image'],
                  placeholder:
                      (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            // Nombre del producto
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                producto['title'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Precio del producto
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'USD ${producto['price']}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
