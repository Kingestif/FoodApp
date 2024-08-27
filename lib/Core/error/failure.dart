import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}
// for our project we only use the above failure but if in case we have server failure for the remote and Cache error for the local
class ServerFailure extends Failure{
  const ServerFailure(super.message);
}

class CacheFailure extends Failure{
  const CacheFailure(super.message);
}

class ConnectionFailure extends Failure{
  const ConnectionFailure(super.message);
}

// class DatabaseFailure extends Failure{
//   const DatabaseFailure(super.message);
// }