import 'package:flutter/material.dart';

class AnimeDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final Color? iconColor;

  const AnimeDetailRow({super.key, 
    required this.label,
    required this.value,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null) Icon(icon, color: iconColor, size: 24),
        if (icon != null) const SizedBox(width: 8),
        Text("$label ", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 16, color: Colors.black87))),
      ],
    );
  }
}
