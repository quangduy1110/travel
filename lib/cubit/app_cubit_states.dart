import 'package:equatable/equatable.dart';
import 'package:flutter_cubit/model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialStates extends CubitStates {
  @override
  List<Object?> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object?> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object?> get props => [places];
}

class DetailState extends CubitStates {
  DetailState(this.places);
  final DataModel places;
  @override
  List<Object?> get props => [places];
}

class WelcomeState extends CubitStates {
  @override
  List<Object?> get props => [];
}
