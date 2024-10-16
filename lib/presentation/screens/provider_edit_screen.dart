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
        actions: [
          _DeleteButton(
            onPress: () async {

              await productProvider.deleteProvider( provider.id );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Proveedor eliminado'),
                  duration: Duration(seconds: 2),
                )
              );
              Navigator.of(context).pop();

            }
          )
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

  final Function() onPress;

  const _DeleteButton({
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPress,
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