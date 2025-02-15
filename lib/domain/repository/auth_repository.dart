
import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/request/auth_request.dart';
import 'package:globenotes/domain/model/authentication.dart';

abstract class AuthRepository{
  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
}