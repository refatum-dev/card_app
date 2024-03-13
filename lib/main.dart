import 'package:card_app/flip_card.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: CardGame()));
}

class CardGame extends FlameGame {
  late SpriteComponent cardFront;
  late SpriteComponent cardBack;

  @override
  Future<void> onLoad() async {
    await setupCard();
  }

  Future<void> setupCard() async {
    FlipCard flipCard = FlipCard(
      frontSprite: await loadSprite('card.png'),
      backSprite: await loadSprite('back.png'),
      cardWidth: 100,
      cardHeight: 150,
      cardPosition: size / 2,
    );

    await add(flipCard);
  }
}
