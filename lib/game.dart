import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/background.dart';
import 'package:flutter_application_1/components/bird.dart';
import 'package:flutter_application_1/components/ground.dart';
import 'package:flutter_application_1/components/pipe.dart';
import 'package:flutter_application_1/components/pipe_manager.dart';
import 'package:flutter_application_1/components/score.dart';
import 'package:flutter_application_1/constants.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late Background background;
  late Ground ground;
  late PipeManager pipeManager;
  late ScoreText scoreText;

  @override
  FutureOr<void> onLoad() {
    background = Background(size);
    add(background);
    bird = Bird();
    add(bird);
    ground = Ground();
    add(ground);
    pipeManager = PipeManager();
    add(pipeManager);
    scoreText = ScoreText();
    add(scoreText);

  }

  @override
  void onTap() {
    bird.flap();
  }

  int score = 0;
  void incrementScore() {
    score += 1;
  }



  bool isGameOver = false;

  void gameOver() {
    if (isGameOver) return;

    isGameOver = true;
    pauseEngine();

    showDialog(
      context: buildContext!,
      builder: (context) => AlertDialog(
        title: const Center(child: Text("Game Over")),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: const Text("Restart"))
        ],
      ),
    );
  }

  void resetGame() {
    bird.position = Vector2(birdStartX, birdStartY);
    bird.velocity = 0;
    isGameOver = false;
    children.whereType<Pipe>().forEach((pipe) => pipe.removeFromParent());

    resumeEngine();
  }
}
