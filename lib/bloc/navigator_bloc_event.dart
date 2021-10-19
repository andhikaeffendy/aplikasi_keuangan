// ignore_for_file: must_be_immutable

part of 'navigator_bloc_bloc.dart';

class NavigatorBlocEvent extends Equatable {
  int selectedPage;

  NavigatorBlocEvent(this.selectedPage);

  @override
  List<Object> get props => [selectedPage];
}

class OnSelectedPage extends NavigatorBlocEvent {
  int? index;
  OnSelectedPage(this.index) : super(0);
}
