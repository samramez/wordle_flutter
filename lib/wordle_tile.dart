import 'package:flutter/material.dart';
import 'package:wordle_flutter/wordle_tile_disposition.dart';

/// This class is the UI for each of the Wordle Tiles.
/// It might have a [letter] in it or not.
class WordleTile extends StatelessWidget {
  final String? letter;
  final WordleTileDisposition disposition;

  const WordleTile({
    Key? key,
    required this.letter,
    required this.disposition,
  }) : super(key: key);

  /// The part after : is called "initializer list. It is a ,-separated list of
  /// expressions that can access constructor parameters and can assign to
  /// instance fields, even final instance fields. This is handy to initialize
  /// final fields with calculated values.
  const WordleTile.empty({
    Key? key,
  })  : letter = null,
        disposition = WordleTileDisposition.missing,
        super(key: key);

  Color _getColor(BuildContext context) {
    switch (disposition) {
      case WordleTileDisposition.correct:
        return Colors.green.shade500;
      case WordleTileDisposition.present:
        return Colors.yellow.shade500;
      case WordleTileDisposition.missing:
        return Colors.black26;
    }
  }

  @override
  Widget build(BuildContext context) {
    final letter = this.letter;
    return Container(
      decoration: BoxDecoration(color: _getColor(context)),
      margin: const EdgeInsets.all(8.0),
      width: 75,
      height: 75,
      child: letter != null ? Text(letter) : null,
    );
  }
}
