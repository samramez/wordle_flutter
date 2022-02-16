/// A model representing the game state.
/// Model knows what the [target] word is what [guesses] user has made so far.
class WordleModel {
  final List<String> guesses;
  final String target;

  /// If you have a Dart class that only contains static methods and constants,
  /// most likely you want to make the class to be non-instantiable.
  /// By declaring a private constructor, Flutter no longer creates the default constructor.
  /// visit http://shorturl.at/oJPV1 for more info.
  /// We can also definie a constructor using curly braces { } to specify named parameters.
  WordleModel._({required this.guesses, required this.target});

  factory WordleModel.init(String target) {
    return WordleModel._(guesses: <String>[], target: target);
  }

  /// This is an immutable model pattern.
  /// when user makes a new guess, a new [WordleModel] is returned which includes the new guess.
  WordleModel withGuesses(String guess) {
    return WordleModel._(
      guesses: List<String>.from(guesses)..add(guess),
      target: target,
    );
  }
}
