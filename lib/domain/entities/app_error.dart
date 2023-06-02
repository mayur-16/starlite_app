

class AppError {
  final AppErrorType errorType;
  final String? error;

  const AppError(this.errorType, {this.error});

  @override
  List<Object> get props => [errorType];
}

enum AppErrorType {
  timeout,
  database,
}
