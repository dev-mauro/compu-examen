import 'package:compu_examen/entities/app_provider_entity.dart';
import 'package:compu_examen/presentation/providers/app_provider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProviderForm extends StatefulWidget {

  final bool isEdit;
  final AppProvider? provider;

  const AppProviderForm({
    super.key,
    this.isEdit = false,
    this.provider,  
  });

  @override
  State<AppProviderForm> createState() => _AppProviderFormState();
}

class _AppProviderFormState extends State<AppProviderForm> {

  final _formKey = GlobalKey<FormState>();
  bool isActive = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if ( widget.isEdit && widget.provider != null ) {
      nameController.text = widget.provider!.name;
      lastNameController.text = widget.provider!.lastName;
      emailController.text = widget.provider!.email;
      isActive = widget.provider!.isActive;
    }
  }

  @override
  Widget build(BuildContext context) {

    final bgColor = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).colorScheme.onPrimary;

    final appProviderProvider = Provider.of<AppProviderProvider>(context);
    // final stateController = 

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
        
            // Campo de nombre
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre del proveedor',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el nombre del proveedor';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
        
            // Campo de apellido
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                labelText: 'Apellido del proveedor',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el apellido del proveedor';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            
            // Campo de email
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email del proveedor',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el email del proveedor';
                } else if ( !value.contains('@') ) {
                  return 'Ingrese un email valido';
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
                    // Editar el proveedor

                    await appProviderProvider.updateProvider(
                      id: widget.provider!.id,
                      name: nameController.text, 
                      lastName: lastNameController.text, 
                      email: emailController.text, 
                      isActive: isActive
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Proveedor actualizado'),
                      )
                    );

                  } else {
                    // Agrega un nuevo proveedor
                    await appProviderProvider.addAppProvider(
                      name: nameController.text, 
                      lastName: lastNameController.text, 
                      email: emailController.text, 
                      isActive: isActive
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Proveedor agregado'),
                      )
                    );

                    // Limpia los campos
                    nameController.clear();
                    lastNameController.clear();
                    emailController.clear();

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