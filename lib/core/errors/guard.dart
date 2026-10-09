import 'package:fpdart/fpdart.dart';
import 'package:json_annotation/json_annotation.dart';

import 'exceptions.dart';
import 'failures.dart';

/// Wykonuje operację warstwy danych i zamienia wyjątki na `Failure`.
Future<Either<Failure, T>> guard<T>(Future<T> Function() action) async {
  try {
    return Right(await action());
  } on InvalidCredentialsException {
    return const Left(InvalidCredentialsFailure());
  } on NotAnAdministratorException {
    return const Left(NotAnAdministratorFailure());
  } on AccountBlockedException {
    return const Left(AccountBlockedFailure());
  } on WeakPasswordException {
    return const Left(WeakPasswordFailure());
  } on UnauthorizedException catch (e) {
    return Left(UnauthorizedFailure(e.message));
  } on NetworkException catch (e) {
    return Left(NetworkFailure(e.message));
  } on ServerException catch (e) {
    return Left(ServerFailure(statusCode: e.statusCode, message: e.message));
  } on ParsingException catch (e) {
    return Left(ServerFailure(message: e.message));
  } on CheckedFromJsonException catch (e) {
    return Left(ServerFailure(message: e.message));
  }
}
