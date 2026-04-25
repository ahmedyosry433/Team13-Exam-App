import 'package:equatable/equatable.dart';

class AnswerEntity extends Equatable {
  final String? answer;
  final String? answerKey;

  const AnswerEntity({this.answer, this.answerKey});

  @override
  List<Object?> get props => [answer, answerKey];
}
