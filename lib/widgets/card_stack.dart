import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/card_stack_state_enum.dart';

import 'card_widget.dart';

class CardStack extends StatefulWidget {
  const CardStack({super.key});

  @override
  State<CardStack> createState() => _CardStackState();
}

class _CardStackState extends State<CardStack>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _animation;

  // bool shouldSpread = false;

  late Tween<CardStackState> tween;

  var initialState = CardStackState.collapsed;
  var finalState = CardStackState.expanded;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
      reverseCurve: Curves.elasticIn,
    );

    tween = Tween(
      begin: CardStackState.collapsed,
      end: CardStackState.expanded,
    );
  }

  handlePress(CardStackState cardStackState) {
    if (controller.isDismissed) {
      controller.forward();
    } else {
      controller.reverse();
    }

    setState(() {
      finalState = cardStackState.isCollapsed
          ? CardStackState.expanded
          : CardStackState.collapsed;
      initialState = cardStackState.isCollapsed
          ? CardStackState.expanded
          : CardStackState.collapsed;
    });
  }

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder(
        curve: Curves.bounceInOut,
        duration: const Duration(milliseconds: 1200),
        tween: Tween(begin: initialState, end: finalState),
        builder: (_, cardStackState, __) {
          return GestureDetector(
            onLongPress: () => handlePress(cardStackState),
            onTap: () => handlePress(cardStackState),
            child: Flow(
              delegate: _CardListFlowDelegate(
                cardSpreadEnum: cardStackState,
                animation: _animation,
              ),
              children: List.generate(4, (index) => index)
                  .map(
                    (el) => const CardWidget(),
                  )
                  .toList(),
            ),
          );
        },
      );
}

class _CardListFlowDelegate extends FlowDelegate {
  final CardStackState cardSpreadEnum;
  final Animation animation;

  _CardListFlowDelegate({
    required this.cardSpreadEnum,
    required this.animation,
  });
  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width / 2;
    final yStart = size.height / 2;
    for (int i = context.childCount - 1; i >= 0; i--) {
      const double margin = 12;
      final childSize = (context.getChildSize(i)!.width * -1) / 2;
      final height = (context.getChildSize(i)!.height * -1) / 2;

      final dx = margin * i;

      final offsetX = cardSpreadEnum.isCollapsed
          ? (childSize + (dx * 3.4 * animation.value))
          : (childSize - dx + (dx * animation.value));

      final offsetY = cardSpreadEnum.isCollapsed
          ? height - sqrt(dx * 30 * animation.value)
          : height + (dx * (1 - animation.value) + (dx * animation.value));

      final angle = (cardSpreadEnum.isCollapsed
          ? (pi / 270) * dx * animation.value
          : (-(pi / 270)) * dx);

      context.paintChild(
        i,
        transform: Matrix4.identity()
          ..setTranslationRaw(xStart + offsetX, yStart + offsetY, 0)
          ..setRotationZ(angle),
      );
    }
  }

  @override
  bool shouldRepaint(_CardListFlowDelegate oldDelegate) => true;
}
