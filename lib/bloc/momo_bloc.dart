import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_app/models/momo.dart';

part 'momo_event.dart';
part 'momo_state.dart';

class MomoBloc extends Bloc<MomoEvent, MomoState> {
  MomoBloc() : super(MomoInitial()) {
    on<LoadMomoCounter>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      emit(const MomoLoaded(momos: <Momo>[]));
    });

    on<AddMomo>((event, emit) {
      if (state is MomoLoaded) {
        final state = this.state as MomoLoaded;
        emit(MomoLoaded(momos: List.from(state.momos)..add(event.momo)));
      }
    });

    on<RemoveMomo>((event, emit) {
      if (state is MomoLoaded) {
        final state = this.state as MomoLoaded;
        emit(MomoLoaded(momos: List.from(state.momos)..remove(event.momo)));
      }
    });
  }
}
