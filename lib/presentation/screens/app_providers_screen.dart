import 'package:compu_examen/config/router/app_router.dart';
import 'package:compu_examen/entities/app_provider_entity.dart';
import 'package:compu_examen/presentation/providers/app_provider_provider.dart';
import 'package:compu_examen/presentation/widgets/app_provider_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvidersScreen extends StatelessWidget {
  const AppProvidersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proveedores'),
      ),
      body: ListView(
        children: const [
          _SectionTitle(title:'Agregar proveedor'),
          AppProviderForm(),
          Divider(),
          _SectionTitle(title: 'Lista de proveedores'),
          _AppProviderList(),
        ]
      ),
    );
  }
}

class _AppProviderList extends StatelessWidget {
  const _AppProviderList();

  @override
  Widget build(BuildContext context) {

    final appProviderProvider = Provider.of<AppProviderProvider>(context);

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: appProviderProvider.providers.length,
        itemBuilder: (context, index) => _AppProviderListTile(
          provider: appProviderProvider.providers[index],
          onTap: () {
            appProviderProvider.selectProvider( appProviderProvider.providers[index] );
            navigateTo(context, AppRoutes.editProvider);
          }
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
    );
  }
}


class _AppProviderListTile extends StatelessWidget {

  final AppProvider provider;
  final Function() onTap;

  const _AppProviderListTile({
    required this.provider,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final Color color = ( provider.isActive )
      ? Theme.of(context).colorScheme.surface
      : Theme.of(context).colorScheme.surfaceContainer;

    final Color onTapColor = Theme.of(context).colorScheme.primaryContainer;

    final String name = ( provider.isActive )
      ? provider.name
      : '(inactivo) ${provider.name}';

    return ListTile(
      title: Text( '$name ${provider.lastName}' ),
      subtitle: Text(provider.email),
      onTap: onTap,
      tileColor: color,
      splashColor: onTapColor,

      leading: const Icon(Icons.person_outline),

      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}


class _SectionTitle extends StatelessWidget {
  
  final String title;
  
  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}