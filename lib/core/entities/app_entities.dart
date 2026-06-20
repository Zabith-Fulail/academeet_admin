import 'package:equatable/equatable.dart';

enum TutorStatus { pending, verified, rejected, suspended }
enum SessionStatus { pending, confirmed, ongoing, completed, cancelled }

class TutorEntity extends Equatable {
  final String id;
  final String fullName;
  final String email;
  final TutorStatus status;
  final double rating;
  final int totalSessions;

  const TutorEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.status,
    required this.rating,
    required this.totalSessions,
  });

  @override List<Object?> get props => [id];
}

class StudentEntity extends Equatable {
  final String id;
  final String fullName;
  final String email;
  final int totalBookings;

  const StudentEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.totalBookings,
  });

  @override List<Object?> get props => [id];
}

class SessionEntity extends Equatable {
  final String id;
  final String studentName;
  final String tutorName;
  final String subject;
  final SessionStatus status;
  final double amount;

  const SessionEntity({
    required this.id,
    required this.studentName,
    required this.tutorName,
    required this.subject,
    required this.status,
    required this.amount,
  });

  @override List<Object?> get props => [id];
}
