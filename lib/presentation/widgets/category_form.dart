import 'package:compu_examen/entities/category_entity.dart';
import 'package:compu_examen/presentation/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryForm extends StatefulWidget {

  final bool isEdit;
  final Category? category;

  const CategoryForm({
    super.key,
    this.isEdit = false,
    this.category,  
  });

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {

  final _formKey = GlobalKey<FormState>();
  bool isActive = true;

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if ( widget.isEdit && widget.category != null ) {
      nameController.text = widget.category!.name;
      isActive = widget.category!.isActive;
    }
  }

  @override
  Widget build(BuildContext context) {

    final bgColor = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).colorScheme.onPrimary;

    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
        
            // Campo nombre de la categoría
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre de la categoría',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el nombre de la categoría';
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

                  if( widget.isEdit ) {
                    // Se edita la categoria
                    await categoryProvider.updateCategory(
                      id: widget.category!.id,
                      name: nameController.text,
                      isActive: isActive,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Categoria actualizada'),
                      ),
                    );

                  } else {
                    // Se agrega una nueva categoria
                    await categoryProvider.addCategory(
                      name: nameController.text,
                    );

                    nameController.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Categoria agregada'),
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