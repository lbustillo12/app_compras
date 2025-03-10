import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.producto});

  final Map<String, dynamic> producto;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          //navegacion a la pantalla de detalle
          // Navigator
          context.goNamed(
            'detalle-producto',
            pathParameters: {'productoId': producto['id'].toString()},
            extra: producto,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image(
              //   height: 250,
              //   fit: BoxFit.fill,
              //   image: NetworkImage(productos[index]['image']),
              // ),
              Center(
                child: CachedNetworkImage(
                  imageUrl: producto['image'],
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget:
                      (context, url, error) =>
                          Image.asset('assets/logo/logo-is.jpg', height: 150),
                ),
                // Image.network(
                //   producto['image'],
                //   height: 150,
                //   fit: BoxFit.fill,
                // ),
              ),
              Text(
                _parsedTitle(producto['title']),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'USD${producto['price']}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _parsedTitle(String title) {
    if (title.length > 20) {
      return '${title.substring(0, 20)}...';
    }
    return title;
  }
}
