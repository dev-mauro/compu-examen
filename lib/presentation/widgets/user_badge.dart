import 'package:compu_examen/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserBadge extends StatelessWidget {
  const UserBadge({super.key});

  @override
  Widget build(BuildContext context) {

    final Widget avatar;

    final authProvider = Provider.of<AuthProvider>(context);
    String? imageUrl = authProvider.appUser!.imageUrl;

    if ( imageUrl == null || imageUrl.isEmpty ) {
      // Si no hay imagen, se muestra un icono por defecto
      avatar = CircleAvatar(
        radius: 20,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        child: const Icon(Icons.person),
      );
    } else {
      // Si hay imagen, se muestra
      avatar = CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(imageUrl),
      );
    }

    // Decoración del badge
    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(35),
      color: Theme.of(context).colorScheme.primaryContainer,
      boxShadow: const [BoxShadow(
        color: Colors.black12,
        blurRadius: 5,
        offset: Offset(0, 2),
      )],
    );

    return Positioned(
      left: 10,
      top: 10,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 7, 25, 7),
        decoration: boxDecoration,
        child: Row(
          children: [
            avatar,
            const SizedBox(width: 10),
            Text('¡Hola, ${authProvider.appUser!.username}!'),
          ],
        ),
      ),
    );
  }
}