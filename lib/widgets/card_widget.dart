import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transformAlignment: Alignment.center,
        height: 160,
        width: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(.4),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 20,
              color: Colors.black.withOpacity(.02),
            ),
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 16,
              color: Colors.blueAccent.withOpacity(.01),
            )
          ],
        ),
      );
}
