import 'package:flutter/material.dart';

class InputTask extends StatelessWidget {
  const InputTask({
    super.key,
    required this.title,
    required this.controller,
    this.isDescription = false,
  });

  final String title;
  final TextEditingController controller;
  final bool isDescription;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: isDescription ? null : 1,
      style: Theme.of(context).textTheme.titleMedium,
      scrollPadding: EdgeInsets.zero,
      decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
          labelText: title,
          labelStyle: Theme.of(context).textTheme.titleMedium),
    );
  }
}
