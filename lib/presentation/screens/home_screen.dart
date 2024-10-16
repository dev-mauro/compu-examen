import 'package:compu_examen/auth/provider/auth_provider.dart';
import 'package:compu_examen/config/router/app_router.dart';
import 'package:compu_examen/presentation/widgets/user_badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Módulos'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authProvider.logout();
              navigateToAndRemove( context, AppRoutes.checkAuth );
            },
            iconSize: 30,
            tooltip: 'Cerrar sesión',
          ),
        ],
      ),
      body: const Stack(
        children: [
          Center(
            child: _CategoryMenu(),
          ),
          UserBadge()
        ]
      ),
    );
  }
}

class _CategoryMenu extends StatelessWidget {
  const _CategoryMenu();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        _CategoryItem(
          onTap: () => navigateTo( context, AppRoutes.providers ),
          title: 'Proveedores',
          icon: Icons.person_outline,
        ),
        _CategoryItem(
          onTap: () => navigateTo( context, AppRoutes.categories ),
          title: 'Categorías',
          icon: Icons.bookmark_border_outlined,
        ),
        _CategoryItem(
          onTap: () => navigateTo( context, AppRoutes.products ),
          title: 'Productos',
          icon: Icons.shopping_bag_outlined,
        ),
      ]
    );
  }
}

class _CategoryItem extends StatelessWidget {

  final void Function() onTap;
  final String title;
  final IconData icon;

  const _CategoryItem({
    required this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
          ),
          const SizedBox( width: 10 ),
          Icon( icon ),
        ],
      ),
      onTap: onTap,
      minTileHeight: 150,
      titleAlignment: ListTileTitleAlignment.top,
    );
  }
}