import 'package:compu_examen/config/router/app_router.dart';
import 'package:compu_examen/entities/product_entity.dart';
import 'package:compu_examen/presentation/providers/product_provider.dart';
import 'package:compu_examen/presentation/widgets/product_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: const Column(
        children: [
          _SectionTitle(title:'Agregar producto'),
          ProductForm(),
          Divider(),
          _SectionTitle(title: 'Lista de productos'),
          _ProductList(),
        ]
      ),
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList();

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context);

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) => _ProductListTile(
          product: productProvider.products[index],
          onTap: () {
            productProvider.selectProduct( productProvider.products[index] );
            navigateTo(context, AppRoutes.editProduct);
          }
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      ),
    );
  }
}


class _ProductListTile extends StatelessWidget {

  final Product product;
  final Function() onTap;

  const _ProductListTile({
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final Color color = ( product.isActive )
      ? Theme.of(context).colorScheme.surface
      : Theme.of(context).colorScheme.surfaceContainer;

    final Color onTapColor = Theme.of(context).colorScheme.primaryContainer;

    final String name = ( product.isActive )
      ? product.name
      : '(inactivo) ${product.name}';

    return ListTile(
      title: Text( name ),
      subtitle: Text('\$ ${product.price}'),
      onTap: onTap,
      tileColor: color,
      splashColor: onTapColor,

      // Imagen del producto
      leading: SizedBox(
        height: 150,
        width: 50,
        child: Image.network(
          product.imageUrl,
          alignment: Alignment.center,
          fit: BoxFit.cover,
          
        )
      ),
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