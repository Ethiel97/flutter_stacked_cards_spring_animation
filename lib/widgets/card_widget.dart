import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transformAlignment: Alignment.center,
        height: 180,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(.5),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 8,
              color: Colors.black.withOpacity(.1),
            ),
            /* BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 16,
              color: Colors.blueAccent.withOpacity(.2),
            ) */
          ],
        ),
      );
}
