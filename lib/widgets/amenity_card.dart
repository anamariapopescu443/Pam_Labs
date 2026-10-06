import 'package:flutter/material.dart';

class AmenityCard extends StatelessWidget {
  final String label;
  final IconData icon;

  const AmenityCard({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F8),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: const Color(0xFFEBEBEB),
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: const Color(0xFF757575),
            size: 20.0,
          ),
          const SizedBox(width: 10.0),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF616161),
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
