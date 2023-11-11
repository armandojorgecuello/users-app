import 'package:equatable/equatable.dart';

abstract class Result<T,E>{
  Result();

  bool get isFail;
  bool get isSuccess;
  E? get failResponse;
  T? get successResponse;

  factory Result.success(T success) = Success;
  factory Result.fail(E error ) = Fail;

  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  });
}

class Success<T,E> extends Result<T,E>{

  final T _success;

  Success(T success) : _success = success;
  
  @override
  get failResponse => null;

  @override
  bool get isFail => false;

  @override
  bool get isSuccess => true;

  @override
  get successResponse => _success;

  @override
  R when<R>({
    required R Function(E p1) fail, 
    required R Function(T p1) success}) 
  {
    return success(_success);
  }
}


class Fail<T,E> extends Result<T,E>{
  final E _fail;

  Fail(E fail) : _fail = fail;
  
  @override
  get failResponse => _fail;

  @override
  bool get isFail => true;

  @override
  bool get isSuccess => false;

  @override
  get successResponse => null;

  @override
  R when<R>({
    required R Function(E p1) fail, 
    required R Function(T p1) success}) 
  {
    return fail(_fail);
  }
}

class Error extends Equatable{
  final String? description;
  final String? error;
  final Map? data;

  Error({
    this.description, 
    this.error, 
    this.data,
  });
  
  @override
  List<Object?> get props => [
    description,
    error,
    data,
  ];
}

class BackendError extends Error{
  final int statusCode;
  final String? description;
  final String? error;
  final Map? data;

  BackendError({
    required this.statusCode, 
    this.description, 
    this.error, 
    this.data
  }) : super(
    description: description,
    error: error,
    data: data,
  );

  @override
  List<Object?> get props => [
    statusCode,
    description,
    error,
    data,
  ];
}