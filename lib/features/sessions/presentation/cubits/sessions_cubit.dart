import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/entities/app_entities.dart';
import '../../../../core/utils/mock_data_service.dart';

abstract class SessionsState extends Equatable {
  @override List<Object?> get props => [];
}
class SessionsInitial extends SessionsState {}
class SessionsLoading extends SessionsState {}
class SessionsLoaded extends SessionsState {
  final List<SessionEntity> sessions;
  SessionsLoaded(this.sessions);
  @override List<Object?> get props => [sessions];
}

class SessionsCubit extends Cubit<SessionsState> {
  final MockDataService _service;
  SessionsCubit(this._service) : super(SessionsInitial());

  Future<void> load() async {
    emit(SessionsLoading());
    final sessions = await _service.getSessions();
    emit(SessionsLoaded(sessions));
  }
}
