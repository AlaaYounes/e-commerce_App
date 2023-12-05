abstract class HomeTabStates {}

class HomeTabLoadingState extends HomeTabStates {}

class HomeTabErrorState extends HomeTabStates {
  String errorMessage;

  HomeTabErrorState({required this.errorMessage});
}

class HomeTabSuccessState extends HomeTabStates {}

class HomeTabGetIndexState extends HomeTabStates {}
