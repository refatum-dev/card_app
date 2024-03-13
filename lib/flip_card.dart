import 'package:card_app/main.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';

class FlipCard extends SpriteComponent
    with TapCallbacks, HasGameReference<CardGame> {
  FlipCard({
    required this.frontSprite,
    required this.backSprite,
    required this.cardWidth,
    required this.cardHeight,
    required this.cardPosition,
  }) : super(
          sprite: frontSprite,
          size: Vector2(cardWidth, cardHeight),
          position: cardPosition,
          anchor: Anchor.center,
        );

  final Sprite frontSprite;
  final Sprite backSprite;
  final double cardWidth;
  final double cardHeight;
  final Vector2 cardPosition;

  bool isFrontVisible = true;

  @override
  Future<void> onLoad() async {
    super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    flipCard();
  }

  void flipCard() {
    add(
      SequenceEffect([
        ScaleEffect.to(Vector2(0, 1.0), EffectController(duration: 0.15)),
      ], onComplete: () {
        sprite = isFrontVisible ? backSprite : frontSprite;

        add(
          SequenceEffect([
            ScaleEffect.to(Vector2(1.0, 1.0), EffectController(duration: 0.15)),
          ], onComplete: () {
            isFrontVisible = !isFrontVisible;
          }),
        );
      }),
    );
  }
}
