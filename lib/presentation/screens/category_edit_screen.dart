// ignore_for_file: use_build_context_synchronously

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
        actions: [
          _DeleteButton(
            onPress: () async {
              await categoryProvider.deleteCategory( category.id );
              
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Categoría eliminada'),
                  backgroundColor: Colors.red,
                )
              );
            }
          )
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
      tooltip: 'Eliminar categoría',
      highlightColor: Colors.red[100],
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.red[50]),
      )
    );
  }
}