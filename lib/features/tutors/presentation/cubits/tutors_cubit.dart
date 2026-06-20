import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/entities/app_entities.dart';
import '../../../../core/utils/mock_data_service.dart';

abstract class TutorsState extends Equatable {
  @override List<Object?> get props => [];
}
class TutorsInitial extends TutorsState {}
class TutorsLoading extends TutorsState {}
class TutorsLoaded extends TutorsState {
  final List<TutorEntity> tutors;
  TutorsLoaded(this.tutors);
  @override List<Object?> get props => [tutors];
}

class TutorsCubit extends Cubit<TutorsState> {
  final MockDataService _service;
  TutorsCubit(this._service) : super(TutorsInitial());

  Future<void> load() async {
    emit(TutorsLoading());
    final tutors = await _service.getTutors();
    emit(TutorsLoaded(tutors));
  }
}
