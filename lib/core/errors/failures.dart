class Failure {
  final String messages;

  Failure(this.messages);
}

class ServerFailures extends Failure {
  ServerFailures(super.messages);
}

class AppFailures extends Failure {
  AppFailures(super.messages);
}
