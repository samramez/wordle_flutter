import 'package:flutter/material.dart';
import 'package:wordle_flutter/wordle_modle.dart';
import 'package:wordle_flutter/wordle_tile.dart';
import 'package:wordle_flutter/wordle_tile_disposition.dart';

const int kNumberOfGuesses = 6;
const int kNumberOfLetters = 5;

class WordleGrid extends StatelessWidget {
  final WordleModel model;

  const WordleGrid({Key? key, required this.model}) : super(key: key);

  WordleTile _buildTile(BuildContext context, int wordIndex, int letterIndex) {
    if (wordIndex >= model.guesses.length) {
      return const WordleTile.empty();
    }
    final guess = model.guesses[wordIndex];
    final letter = guess[letterIndex];
    final WordleTileDisposition disposition;
    if (model.target[letterIndex] == letter) {
      disposition = WordleTileDisposition.correct;
    } else if (model.target.contains(letter)) {
      disposition = WordleTileDisposition.present;
    } else {
      disposition = WordleTileDisposition.missing;
    }
    return WordleTile(letter: letter, disposition: disposition);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      for (int wordIndex = 0; wordIndex < kNumberOfGuesses; ++wordIndex)
        Row(
          children: <Widget>[
            for (int letterIndex = 0;
                letterIndex < kNumberOfLetters;
                ++letterIndex)
              _buildTile(context, wordIndex, letterIndex)
          ],
        )
    ]);
  }
}
