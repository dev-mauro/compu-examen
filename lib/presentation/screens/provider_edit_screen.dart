import 'package:compu_examen/presentation/providers/app_provider_provider.dart';
import 'package:compu_examen/presentation/widgets/app_provider_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderEditScreen extends StatelessWidget {
  const ProviderEditScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<AppProviderProvider>(context);

    final provider = productProvider.selectedProvider!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar proveedor'),
        actions: const [
          _DeleteButton()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: AppProviderForm(
          isEdit: true,
          provider: provider,
        ),
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
        // TODO: Delete del producto
      },
      icon: const Icon(Icons.delete_outline),
      color: Colors.red,
      iconSize: 35,
      tooltip: 'Eliminar proveedor',
      highlightColor: Colors.red[100],
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.red[50]),
      )
    );
  }
}