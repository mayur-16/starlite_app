import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:starlite_app/presentation/theme/theme_extension.dart';

class AddProductDialogBox extends StatefulWidget {
  const AddProductDialogBox({Key? key}) : super(key: key);

  @override
  State<AddProductDialogBox> createState() => _AddProductDialogBoxState();
}

class _AddProductDialogBoxState extends State<AddProductDialogBox> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('New Product'),
      content: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'productname',
                style: Theme.of(context).textTheme.formfieldtextStyle,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'Enter product name'),
                ]),
              ),
              const Gap(20),
              FormBuilderTextField(
                name: 'productdesc',
                maxLines: 4,
                minLines: 3,
                style: Theme.of(context).textTheme.formfieldtextStyle,
                textInputAction: TextInputAction.newline,
                decoration: const InputDecoration(
                  labelText: 'Product Description',
                ),
              ),
              const Gap(20),
              FormBuilderTextField(
                name: 'stock',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLength: 5,
                keyboardType: TextInputType.number,
                style: Theme.of(context).textTheme.formfieldtextStyle,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'\d'),
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Stock',
                  counterText: '',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.integer(errorText: 'Invalid stock value'),
                  FormBuilderValidators.required(errorText: 'Enter stock'),
                ]),
              ),
              const Gap(20),
              FormBuilderTextField(
                name: 'productprice',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLength: 7,
                keyboardType: TextInputType.number,
                style: Theme.of(context).textTheme.formfieldtextStyle,
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'\d'),
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Product Price',
                  counterText: '',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.integer(errorText: 'Invalid price'),
                  FormBuilderValidators.required(errorText: 'Enter product price'),
                ]),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add')),
        const SizedBox(
          height: 10,
        ),
        OutlinedButton(
          style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                minimumSize: const MaterialStatePropertyAll(
                  Size(double.maxFinite, 45),
                ),
              ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
