import 'package:compu_examen/presentation/providers/product_provider.dart';
import 'package:compu_examen/presentation/widgets/product_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductEditScreen extends StatelessWidget {
  const ProductEditScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context);

    final product = productProvider.selectedProduct!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar producto'),
        actions: [
          _DeleteButton(
            onPress: () async {
              await productProvider.deleteProduct(id: product.id);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Producto eliminado'),
                  duration: Duration(seconds: 2),
                )
              );
              Navigator.pop(context);
            }
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ProductForm(
          isEdit: true,
          product: product,
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
    return IconButton(
      onPressed: onPress,
      icon: const Icon(Icons.delete_outline),
      color: Colors.red,
      iconSize: 35,
      tooltip: 'Eliminar producto',
      highlightColor: Colors.red[100],
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.red[50]),
      )
    );
  }
}