import 'package:flutter/material.dart';

class Filter extends StatelessWidget {

  final VoidCallback? onTap;
  final String label;
  final bool active;

  const Filter({
    required this.label,
    this.active = false,
    this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(active ? 0 : 1),
        child: Chip(
          label: Text(label),
          side: active ? const BorderSide(color: Colors.white) : null,
        ),
      ),
    );
  }
}