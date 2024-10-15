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
        actions: const [
          _DeleteButton()
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
  const _DeleteButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
        // TODO: Delete del producto
      },
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