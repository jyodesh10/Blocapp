part of 'momo_bloc.dart';

abstract class MomoState extends Equatable {
  const MomoState();

  @override
  List<Object> get props => [];
}

class MomoInitial extends MomoState {}

class MomoLoaded extends MomoState {
  final List<Momo> momos;

  const MomoLoaded({required this.momos});
  @override
  List<Object> get props => [momos];
}
