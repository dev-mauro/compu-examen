import 'package:compu_examen/entities/product_entity.dart';
import 'package:compu_examen/presentation/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductForm extends StatefulWidget {

  final bool isEdit;
  final Product? product;

  const ProductForm({
    super.key,
    this.isEdit = false,
    this.product,  
  });

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

  final _formKey = GlobalKey<FormState>();
  bool isActive = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if ( widget.isEdit && widget.product != null ) {
      nameController.text = widget.product!.name;
      priceController.text = widget.product!.price.toString();
      imageController.text = widget.product!.imageUrl;
      isActive = widget.product!.isActive;
    }
  }

  @override
  Widget build(BuildContext context) {

    final bgColor = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).colorScheme.onPrimary;

    final productProvider = Provider.of<ProductProvider>(context);
    // final stateController = 

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre del producto',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el nombre del producto';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
        
            TextFormField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: 'Precio',
                prefix: Text('\$ '),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el precio del producto';
                } else if (int.tryParse(value) == null) {
                  return 'Ingrese un número válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
        
            TextFormField(
              controller: imageController,
              decoration: const InputDecoration(
                labelText: 'URL de la imagen',
                hintText: 'https://ejemplo.com/image.png',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if ( value != null && value.isNotEmpty ) {
                  if (!Uri.parse(value).isAbsolute) {
                    return 'Ingrese una URL válida';
                  }
                }
        
                return null;
              },
            ),
            const SizedBox(height: 20),
        
            // Control para activar o desactivar el producto
            ( widget.isEdit ) ?
                Row(
                children: [
                  const Text('Activo'),
                  const SizedBox(width: 10),
                  Switch(
                    value: isActive,
                    onChanged: (_) => setState(() => isActive = !isActive)
                  ),
                ]
              ): const SizedBox(),
            SizedBox(height: (widget.isEdit) ? 20 : 0),
        
        
            // Boton para agregar o editar el producto
            ElevatedButton(
              onPressed: () async {
                if( _formKey.currentState!.validate() ) {
                  // TODO: Agregar el producto

                  if( !widget.isEdit ) {
                    // Se agrega producto nuevo
                    await productProvider.addProduct(
                      name: nameController.text,
                      price: int.parse(priceController.text),
                      imageUrl: imageController.text,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Producto agregado'),
                      ),
                    );

                    // Limpia los campos
                    nameController.clear();
                    priceController.clear();
                    imageController.clear();
                  } else {
                    // Se edita un producto existente
                    await productProvider.updateProduct(
                      id: widget.product!.id,
                      name: nameController.text,
                      price: int.parse(priceController.text),
                      imageUrl: imageController.text,
                      isActive: isActive,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Producto actualizado'),
                      ),
                    );
                  }


        
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: bgColor,
                foregroundColor: textColor,
              ),
              child: ( widget.isEdit ) ? const Text('Editar') : const Text('Agregar'),
            ),
            const SizedBox(height: 20),
          ]
        ),
      ),
    );
  }
}