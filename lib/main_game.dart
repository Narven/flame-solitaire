import 'package:flame/game.dart';
import 'package:flame_solitaire/components/card.dart';
import 'package:flame_solitaire/components/table.dart';

typedef Cards = List<CardModel>;

class CardModel {
  CardModel({required this.suit, required this.value});
  CardSuit suit;
  CardValue value;
}

class MainGame extends FlameGame {
  Cards deck = [];

  final Cards finalHearts = [];
  final Cards finalClubs = [];
  final Cards finalDiamonds = [];
  final Cards finalSpades = [];

  @override
  Future<void> onLoad() async {
    super.onLoad();

    add(Table());

    deck = _generateCards();
    deck.shuffle();
    for (var c = 0; c < deck.length; c++) {
      add(
        Card(
          suit: deck[c].suit,
          type: deck[c].value,
          pos: Vector2(40 + c.toDouble(), 40),
        ),
      );
    }
  }

  Cards _generateCards() {
    final suits = <CardSuit>[
      CardSuit.club,
      CardSuit.diamond,
      CardSuit.heart,
      CardSuit.spade
    ];

    final values = <CardValue>[
      CardValue.vA,
      CardValue.v2,
      CardValue.v3,
      CardValue.v4,
      CardValue.v5,
      CardValue.v6,
      CardValue.v7,
      CardValue.v8,
      CardValue.v9,
      CardValue.v10,
      CardValue.vK,
      CardValue.vJ,
      CardValue.vQ,
    ];

    List<CardModel> cards = [];
    for (var s = 0; s < suits.length; s++) {
      for (var v = 0; v < values.length; v++) {
        cards.add(CardModel(suit: suits[s], value: values[v]));
      }
    }
    return cards;
  }
}
