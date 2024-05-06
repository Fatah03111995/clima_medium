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
            style: TextStyles.formValue,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(width: 3.0, color: Colors.black),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(width: 3.0, color: Colors.red),
                ),
                errorStyle: TextStyles.formError,
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(width: 3.0, color: Colors.blue)),
                filled: true,
                fillColor: Colors.black.withOpacity(0.5),
                labelText: label,
                labelStyle: TextStyles.formLabel,
                hintText: hint,
                hintStyle: TextStyles.formHint,
                prefixIcon: Icon(
                  icon,
                  size: 25,
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
