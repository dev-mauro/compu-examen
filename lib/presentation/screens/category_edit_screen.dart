import 'package:compu_examen/presentation/providers/category_provider.dart';
import 'package:compu_examen/presentation/widgets/category_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryEditScreen extends StatelessWidget {
  const CategoryEditScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final categoryProvider = Provider.of<CategoryProvider>(context);

    final category = categoryProvider.selectedCategory!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar categoría'),
        actions: const [
          _DeleteButton()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: CategoryForm(
          isEdit: true,
          category: category,
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
        // TODO: Delete de la categoría
      },
      icon: const Icon(Icons.delete_outline),
      color: Colors.red,
      iconSize: 35,
      tooltip: 'Eliminar categoría',
      highlightColor: Colors.red[100],
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.red[50]),
      )
    );
  }
}