import 'package:equatable/equatable.dart';

class SubjectsEntity extends Equatable {
  final String? id;
  final String? name;
  final String? icon;
  final DateTime? createdAt;
   const SubjectsEntity({this.id, this.name, this.icon, this.createdAt});

  @override
  List<Object?> get props => [id, name, icon, createdAt];
}
