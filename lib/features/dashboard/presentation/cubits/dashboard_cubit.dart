import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/mock_data_service.dart';

abstract class DashboardState extends Equatable {
  @override List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}
class DashboardLoading extends DashboardState {}
class DashboardLoaded extends DashboardState {
  final int totalTutors;
  final int totalStudents;
  final int totalSessions;
  final double revenue;
  DashboardLoaded(this.totalTutors, this.totalStudents, this.totalSessions, this.revenue);
  @override List<Object?> get props => [totalTutors];
}
class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}

class DashboardCubit extends Cubit<DashboardState> {
  final MockDataService _service;
  DashboardCubit(this._service) : super(DashboardInitial());

  Future<void> load() async {
    emit(DashboardLoading());
    try {
      final tutors = await _service.getTutors();
      final students = await _service.getStudents();
      final sessions = await _service.getSessions();
      emit(DashboardLoaded(tutors.length, students.length, sessions.length, 28500));
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }
}
