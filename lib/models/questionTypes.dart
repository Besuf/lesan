import 'package:json_annotation/json_annotation.dart';
part 'questionTypes.g.dart';

@JsonSerializable()
class Module{
  String moduleName;
  List<Question1> chooseImages;
  List<Question2> wordPuzzels;
  List<Question3> writeSentences;
  Module({this.moduleName, this.chooseImages, this.writeSentences});

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
  Map<String, dynamic> toJson() => _$ModuleToJson(this);

}
@JsonSerializable()
class Question3{
  String questionAudioURL;
  List<Word3> options;
  List<Word3> correctAnswer;
  Question3({this.questionAudioURL, this.options, this.correctAnswer});
  factory Question3.fromJson(Map<String, dynamic> json) => _$Question3FromJson(json);
}

@JsonSerializable()
class Word3{
  String text;
  bool isSelected = false;
  Word3(this.text);
  factory Word3.fromJson(Map<String, dynamic> json) => _$Word3FromJson(json);
}

@JsonSerializable()
class Question1{
  String question;
  Question1Card option1;
  Question1Card option2;
  Question1Card option3;
  Question1Card option4;
  String answer;
  Question1({this.question, this.option1, this.option2, this.option3, this.option4, this.answer});
  factory Question1.fromJson(Map<String, dynamic> json) => _$Question1FromJson(json);

}

@JsonSerializable()
class Question1Card{
  String optionName;
  String imgURL;
  String soundURL;
  Question1Card({this.optionName, this.imgURL, this.soundURL});
  factory Question1Card.fromJson(Map<String, dynamic> json) => _$Question1CardFromJson(json);
}

@JsonSerializable()
class Question2 {
  String sourceText;
  List<Word2> wordChoices;
  List<Word2> correctSequence;

  Question2({this.sourceText, this.wordChoices, this.correctSequence});
  factory Question2.fromJson(Map<String, dynamic> json) => _$Question2FromJson(json);
}

@JsonSerializable()
class Word2 {
  String text;
  bool selected = false;

  Word2(this.text);

  @override
  bool operator ==(other) => other is Word2 && other.text == text;

  @override
  int get hashCode => text.hashCode;

  factory Word2.fromJson(Map<String, dynamic> json) => _$Word2FromJson(json);
}