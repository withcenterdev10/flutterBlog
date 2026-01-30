import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, required this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24, // reduce size
            height: 24,
            child: CircularProgressIndicator(
              color: Colors.blueAccent,
              strokeWidth: 3,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            message!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
