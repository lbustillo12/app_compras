import 'package:flutter/material.dart';
import 'package:app_compras/src/widgets/header_side_menu.dart';
import 'package:app_compras/src/widgets/menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      child: SafeArea(
        child: ListView(
          children: [
            HeaderSideMenu(
              title: 'Lizy Bustillo',
              email: 'lizy.bustillo@unah.hn',
            ),
            MenuItem(texto: 'Inicio', icon: Icons.home),

            ExpansionTile(
              leading: Icon(Icons.checkroom),
              title: Text('Ropa'),
              // Título de la opción
              trailing: Icon(Icons.keyboard_arrow_down),
              children: [
                ListTile(
                  leading: Icon(
                    Icons.man,
                    color: Colors.blue,
                  ), // Ícono de Hombre
                  title: Text('Hombre'),
                  onTap: () {},
                ),

                ListTile(
                  leading: Icon(
                    Icons.woman,
                    color: Colors.pink,
                  ), // Ícono de Mujer
                  title: Text('Mujer'),
                  onTap: () {},
                ),
              ],
            ),

            MenuItem(texto: 'Tecnologia', icon: Icons.computer),
            MenuItem(texto: 'Pedidos', icon: Icons.local_mall),
            MenuItem(texto: 'Sucursales', icon: Icons.store),

            MenuItem(texto: 'Atencion al cliente', icon: Icons.support_agent),
            ListTile(
              leading: Icon(Icons.people),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text('Crear Comunidad'),
              onTap: () {},
              subtitle: Text('Pantalla principal'),
            ),
            Divider(color: Colors.black, thickness: 0.5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                'Ajustes de la cuenta',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text('Configuración'),
              onTap: () {},
              // subtitle: Text('Pantalla principal de reseñas'),
            ),
          ],
        ),
      ),
    );
  }
}
