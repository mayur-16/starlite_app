part of 'database_cubit.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();
}

class DatabaseInitial extends DatabaseState {
  @override
  List<Object> get props => [];
}

class DatabaseInitializationLoading extends DatabaseState {
  @override
  List<Object> get props => [];
}

class DatabaseInitializationSuccess extends DatabaseState {
  @override
  List<Object> get props => [];
}

class DatabaseInitializationFailed extends DatabaseState {
  final AppError appError;

  const DatabaseInitializationFailed({required this.appError});

  @override
  List<Object> get props => [appError];
}
