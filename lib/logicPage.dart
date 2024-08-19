import 'questionStuffs.dart';

class LogicPage {
  int _questionNumber = 0;
  final List<Questions> _questionStuffs = [
    Questions('Sharks are mammals.', false),
    Questions(
        'Sea otters have a favorite rock they use to break open food.', true),
    Questions('The blue whale is the biggest animal to have ever lived.', true),
    Questions('The hummingbird egg is the world\'s smallest bird egg.', true),
    Questions(
        'Pigs roll in the mud because they don\st like being clean.', false),
    Questions('Bats are blind.', false),
    Questions(
        'The largest living frog is the Goliath frog of West Africa.', true),
    Questions('An ant can lift 1,000 times its body weight.', false),
    Questions('Herbivores are animal eaters.', false),
    Questions('A monkey was the first non-human to go into space.', false),
    Questions('Greenland is the largest island in the world.', true),
    Questions(
        'The average human sneeze can be clocked at 100 miles an hour.', true),
    Questions('The heart is the largest internal organ in the body.', false),
    Questions('Humans lose more than 80% of heat from their feet.', false),
    Questions('Toy Story was Pixar\s first movie.', true),
    Questions(
        'The Aristocats was the first film to be made after Walt Disney\s death.',
        true),
    Questions('Cheesecake comes from Italy.', false),
    Questions('Pepperoni is the most popular pizza topping in the US.', true),
    Questions('Pizza was the first food consumed in space.', false),
    Questions(
        'A potato was the first vegetable to be planted on the space shuttle.',
        true),
  ];

  void anotherQuestion() {
    if (_questionNumber < _questionStuffs.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionTexts() {
    return _questionStuffs[_questionNumber].questionMarks;
  }

  bool getCorrectAnswers() {
    return _questionStuffs[_questionNumber].questionAnswers;
  }

  bool userFinished() {
    if (_questionNumber >= _questionStuffs.length - 1) {
      print('Finished!');
      return true;
    } else {
      return false;
    }
  }

  void restartGame() {
    _questionNumber = 0;
  }
}
// There are 20 questions in total
