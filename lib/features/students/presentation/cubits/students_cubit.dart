import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/entities/app_entities.dart';
import '../../../../core/utils/mock_data_service.dart';

abstract class StudentsState extends Equatable {
  @override List<Object?> get props => [];
}
class StudentsInitial extends StudentsState {}
class StudentsLoading extends StudentsState {}
class StudentsLoaded extends StudentsState {
  final List<StudentEntity> students;
  StudentsLoaded(this.students);
  @override List<Object?> get props => [students];
}

class StudentsCubit extends Cubit<StudentsState> {
  final MockDataService _service;
  StudentsCubit(this._service) : super(StudentsInitial());

  Future<void> load() async {
    emit(StudentsLoading());
    final students = await _service.getStudents();
    emit(StudentsLoaded(students));
  }
}
