
import 'package:equatable/equatable.dart';

class ResultState<T,E> extends Equatable{

  final T? data;
  final E? error;
  final bool? isLoading;
  final bool? initial;

  const ResultState({
    this.data, 
    this.error, 
    this.isLoading, 
    this.initial
  });

  factory ResultState.data(T data)=>ResultState(data:data);
  factory ResultState.error(E error)=>ResultState(error:error);
  factory ResultState.initial()=>const ResultState(initial:true);
  factory ResultState.isLoading()=>const ResultState(isLoading:true);

  ResultState<T,E> copyWith({
    T? data,
    E? error,
    bool? isLoading,
    bool? initial,
  }){
    return ResultState(
      data:data ?? this.data,
      error:error ?? this.error,
      isLoading:isLoading ?? this.isLoading,
      initial:initial ?? this.initial,
    );
  }
  
  @override
  List<Object?> get props => [
    data,
    error,
    isLoading,
    initial,
  ];


}