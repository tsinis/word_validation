import '../models/unique_words.dart';

class WordsRepository {
  final UniqueWords _uniqueWords;

  UniqueWords get words =>
      UniqueWords.unmodifiable(_uniqueWords.toList().reversed);

  WordsRepository({required UniqueWords uniqueWords})
      : _uniqueWords = uniqueWords;

  void addWord(String word) => _uniqueWords.add(word);
}
