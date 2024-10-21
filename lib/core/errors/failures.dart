class Failure {
  final String messages;

  Failure(this.messages);
}

class ServerFailures extends Failure {
  ServerFailures(super.messages);
}
