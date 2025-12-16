import 'package:flutter/material.dart';

class Sport extends StatelessWidget {
  final String title;
  final IconData icon;

  const Sport({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Icon(icon),
        ),
        const SizedBox(height: 4.0),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}