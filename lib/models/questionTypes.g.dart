// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionTypes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) {
  return Module(
    moduleName: json['moduleName'] as String,
    chooseImages: (json['chooseImages'] as List)
        ?.map((e) =>
            e == null ? null : Question1.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    writeSentences: (json['writeSentences'] as List)
        ?.map((e) =>
            e == null ? null : Question3.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..wordPuzzels = (json['wordPuzzels'] as List)
      ?.map((e) =>
          e == null ? null : Question2.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'moduleName': instance.moduleName,
      'chooseImages': instance.chooseImages,
      'wordPuzzels': instance.wordPuzzels,
      'writeSentences': instance.writeSentences,
    };

Question3 _$Question3FromJson(Map<String, dynamic> json) {
  return Question3(
    questionAudioURL: json['questionAudioURL'] as String,
    options: (json['options'] as List)
        ?.map(
            (e) => e == null ? null : Word3.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    correctAnswer: (json['correctAnswer'] as List)
        ?.map(
            (e) => e == null ? null : Word3.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$Question3ToJson(Question3 instance) => <String, dynamic>{
      'questionAudioURL': instance.questionAudioURL,
      'options': instance.options,
      'correctAnswer': instance.correctAnswer,
    };

Word3 _$Word3FromJson(Map<String, dynamic> json) {
  return Word3(
    json['text'] as String,
  )..isSelected = json['isSelected'] as bool;
}

Map<String, dynamic> _$Word3ToJson(Word3 instance) => <String, dynamic>{
      'text': instance.text,
      'isSelected': instance.isSelected,
    };

Question1 _$Question1FromJson(Map<String, dynamic> json) {
  return Question1(
    question: json['question'] as String,
    option1: json['option1'] == null
        ? null
        : Question1Card.fromJson(json['option1'] as Map<String, dynamic>),
    option2: json['option2'] == null
        ? null
        : Question1Card.fromJson(json['option2'] as Map<String, dynamic>),
    option3: json['option3'] == null
        ? null
        : Question1Card.fromJson(json['option3'] as Map<String, dynamic>),
    option4: json['option4'] == null
        ? null
        : Question1Card.fromJson(json['option4'] as Map<String, dynamic>),
    answer: json['answer'] as String,
  );
}

Map<String, dynamic> _$Question1ToJson(Question1 instance) => <String, dynamic>{
      'question': instance.question,
      'option1': instance.option1,
      'option2': instance.option2,
      'option3': instance.option3,
      'option4': instance.option4,
      'answer': instance.answer,
    };

Question1Card _$Question1CardFromJson(Map<String, dynamic> json) {
  return Question1Card(
    optionName: json['optionName'] as String,
    imgURL: json['imgURL'] as String,
    soundURL: json['soundURL'] as String,
  );
}

Map<String, dynamic> _$Question1CardToJson(Question1Card instance) =>
    <String, dynamic>{
      'optionName': instance.optionName,
      'imgURL': instance.imgURL,
      'soundURL': instance.soundURL,
    };

Question2 _$Question2FromJson(Map<String, dynamic> json) {
  return Question2(
    sourceText: json['sourceText'] as String,
    wordChoices: (json['wordChoices'] as List)
        ?.map(
            (e) => e == null ? null : Word2.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    correctSequence: (json['correctSequence'] as List)
        ?.map(
            (e) => e == null ? null : Word2.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$Question2ToJson(Question2 instance) => <String, dynamic>{
      'sourceText': instance.sourceText,
      'wordChoices': instance.wordChoices,
      'correctSequence': instance.correctSequence,
    };

Word2 _$Word2FromJson(Map<String, dynamic> json) {
  return Word2(
    json['text'] as String,
  )..selected = json['selected'] as bool;
}

Map<String, dynamic> _$Word2ToJson(Word2 instance) => <String, dynamic>{
      'text': instance.text,
      'selected': instance.selected,
    };
