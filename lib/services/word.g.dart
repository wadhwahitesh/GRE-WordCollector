// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) {
  return Word(
    word: json['word'] as String,
  )
    ..synonyms =
        (json['synonyms'] as List<dynamic>).map((e) => e as String).toList()
    ..meanings = (json['meanings'] as List<dynamic>)
        .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
        .toList()
    ..sentences =
        (json['sentences'] as List<dynamic>).map((e) => e as String).toList()
    ..mnemonic = json['mnemonic'] as String
    ..times = json['times'] as int;
}

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'word': instance.word,
      'synonyms': instance.synonyms,
      'meanings': instance.meanings,
      'sentences': instance.sentences,
      'mnemonic': instance.mnemonic,
      'times': instance.times,
    };
