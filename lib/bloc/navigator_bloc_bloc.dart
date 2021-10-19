import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'navigator_bloc_event.dart';
part 'navigator_bloc_state.dart';

class NavigatorBlocBloc extends Bloc<NavigatorBlocEvent, NavigatorBlocState> {
  NavigatorBlocBloc() : super(NavigatorBlocInitial([0]));

  PageController page = PageController();

  Stream<NavigatorBlocState> mapEventToState(NavigatorBlocEvent event) async* {
    if (event is NavigatorBlocEvent) {
      yield NavigatorBlocState(selectedPage: event.selectedPage);
    }
    if (event is OnSelectedPage) {
      yield NavigatorBlocState(selectedPage: event.index!);
    }
  }
}
