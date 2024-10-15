import 'package:compu_examen/config/router/app_router.dart';
import 'package:compu_examen/entities/category_entity.dart';
import 'package:compu_examen/presentation/providers/category_provider.dart';
import 'package:compu_examen/presentation/widgets/category_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),
      body: ListView(
        children: const [
          _SectionTitle(title:'Agregar categoría'),
          CategoryForm(),
          Divider(),
          _SectionTitle(title: 'Lista de categorías'),
          _CategoryList(),
        ]
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context) {

    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categoryProvider.categories.length,
        itemBuilder: (context, index) => _CategoryListTile(
          category: categoryProvider.categories[index],
          onTap: () {
            categoryProvider.selectCategory( categoryProvider.categories[index] );
            navigateTo(context, AppRoutes.editCategory);
          }
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
    );
  }
}


class _CategoryListTile extends StatelessWidget {

  final Category category;
  final Function() onTap;

  const _CategoryListTile({
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final Color color = ( category.isActive )
      ? Theme.of(context).colorScheme.surface
      : Theme.of(context).colorScheme.surfaceContainer;

    final Color onTapColor = Theme.of(context).colorScheme.primaryContainer;

    final String name = ( category.isActive )
      ? category.name
      : '(inactivo) ${category.name}';

    return ListTile(
      title: Text( name ),
      // subtitle: Text('\$ ${product.price}'),
      onTap: onTap,
      tileColor: color,
      splashColor: onTapColor,

      leading: Icon(Icons.bookmark_border),

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