import 'package:flame/components.dart';
import 'package:flame_solitaire/main_game.dart';

enum CardSuit {
  heart,
  club,
  diamond,
  spade,
}

enum CardValue {
  v2,
  v3,
  v4,
  v5,
  v6,
  v7,
  v8,
  v9,
  v10,
  vA,
  vJ,
  vK,
  vQ,
}

class Card extends SpriteComponent with HasGameRef<MainGame> {
  Card({
    required this.suit,
    required this.type,
    required this.pos,
  });

  final CardSuit suit;
  final CardValue type;
  final Vector2 pos;

  @override
  Future<void> onLoad() async {
    sprite = await _getImage();
    size = Vector2(417, 654) / 3;
    position = pos;
  }

  Future<Sprite> _getImage() async {
    String s;
    String v;

    switch (suit) {
      case CardSuit.heart:
        s = 'Hearts';
        break;
      case CardSuit.club:
        s = 'Clubs';
        break;
      case CardSuit.diamond:
        s = 'Diamonds';
        break;
      case CardSuit.spade:
        s = 'Spades';
        break;
    }

    switch (type) {
      case CardValue.v2:
        v = '2';
        break;
      case CardValue.v3:
        v = '3';
        break;
      case CardValue.v4:
        v = '4';
        break;
      case CardValue.v5:
        v = '5';
        break;
      case CardValue.v6:
        v = '6';
        break;
      case CardValue.v7:
        v = '7';
        break;
      case CardValue.v8:
        v = '8';
        break;
      case CardValue.v9:
        v = '9';
        break;
      case CardValue.v10:
        v = '10';
        break;
      case CardValue.vA:
        v = 'A';
        break;
      case CardValue.vJ:
        v = 'J';
        break;
      case CardValue.vK:
        v = 'K';
        break;
      case CardValue.vQ:
        v = 'Q';
        break;
    }

    return await gameRef.loadSprite('card${s}_$v.png');
  }
}
