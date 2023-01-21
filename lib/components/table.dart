import 'package:flame/components.dart';
import 'package:flame_solitaire/contants/globals.dart';
import 'package:flame_solitaire/main_game.dart';

class Table extends SpriteComponent with HasGameRef<MainGame> {
  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(Globals.background2);
    size = gameRef.size;
  }

  @override
  void update(double dt) {
    super.update(dt);
    size = gameRef.size;
  }
}
