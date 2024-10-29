part of 'tips_cubit.dart';

abstract class TipsState extends Equatable {
  const TipsState();
}
class TipsInitial extends TipsState {
  @override
  List<Object> get props => [];
}
class TipsLoadingState extends TipsState {
  @override
  List<Object> get props => [];
}
class TipsFetchedState extends TipsState {
  List<TipResponse> items;
  TipsFetchedState(this.items);
  @override
  List<Object> get props => [];
}
class TipsErrorState extends TipsState {
  String error;
  TipsErrorState(this.error);
  @override
  List<Object> get props => [];
}