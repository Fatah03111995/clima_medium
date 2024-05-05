import 'package:clima_medium/utilities/textstyle.dart';
import 'package:flutter/material.dart';

class FormFieldTxt extends StatelessWidget {
  final String? hint;
  final String label;
  final TextEditingController txtController;
  final IconData icon;
  const FormFieldTxt(
      {super.key,
      required this.hint,
      required this.txtController,
      required this.icon,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black.withOpacity(0.5),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                labelText: label,
                labelStyle: TextStyles.valDefault,
                hintText: hint,
                hintStyle: TextStyles.valDefault,
                prefixIcon: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 50)),
            controller: txtController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'required, please fill this column';
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}
