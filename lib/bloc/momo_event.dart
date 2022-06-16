part of 'momo_bloc.dart';

abstract class MomoEvent extends Equatable {
  const MomoEvent();

  @override
  List<Object> get props => [];
}

class LoadMomoCounter extends MomoEvent {}

class AddMomo extends MomoEvent {
  final Momo momo;

  const AddMomo(this.momo);

  @override
  List<Object> get props => [momo];
}

class RemoveMomo extends MomoEvent {
  final Momo momo;

  const RemoveMomo(this.momo);

  @override
  List<Object> get props => [momo];
}
