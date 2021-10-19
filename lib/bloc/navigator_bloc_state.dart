// ignore_for_file: must_be_immutable

part of 'navigator_bloc_bloc.dart';

class NavigatorBlocState extends Equatable {
  int selectedPage;

  NavigatorBlocState({required this.selectedPage});

  @override
  List<Object> get props => [selectedPage];
}

class NavigatorBlocInitial extends NavigatorBlocState {
  NavigatorBlocInitial(List page) : super(selectedPage: 0);
}
