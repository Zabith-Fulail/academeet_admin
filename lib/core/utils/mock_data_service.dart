import 'package:uuid/uuid.dart';
import '../entities/app_entities.dart';

class MockDataService {
  static final MockDataService _instance = MockDataService._internal();
  factory MockDataService() => _instance;
  MockDataService._internal();

  final _uuid = const Uuid();

  Future<List<TutorEntity>> getTutors() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      TutorEntity(
        id: _uuid.v4(),
        fullName: 'Ruwan Perera',
        email: 'ruwan@gmail.com',
        status: TutorStatus.verified,
        rating: 4.5,
        totalSessions: 50,
      ),
      TutorEntity(
        id: _uuid.v4(),
        fullName: 'Nadeesha Silva',
        email: 'nadeesha@gmail.com',
        status: TutorStatus.pending,
        rating: 0,
        totalSessions: 0,
      ),
    ];
  }

  Future<List<StudentEntity>> getStudents() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      StudentEntity(
        id: _uuid.v4(),
        fullName: 'Hiruni Perera',
        email: 'hiruni@gmail.com',
        totalBookings: 5,
      ),
      StudentEntity(
        id: _uuid.v4(),
        fullName: 'Ashen Silva',
        email: 'ashen@gmail.com',
        totalBookings: 3,
      ),
    ];
  }

  Future<List<SessionEntity>> getSessions() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      SessionEntity(
        id: _uuid.v4(),
        studentName: 'Hiruni',
        tutorName: 'Ruwan',
        subject: 'Mathematics',
        status: SessionStatus.completed,
        amount: 2500,
      ),
    ];
  }
}
