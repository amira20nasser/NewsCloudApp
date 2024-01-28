abstract class AddDeleteNewsState {}

class AddNewsInitial extends AddDeleteNewsState {}

class AddNewsLoading extends AddDeleteNewsState {}

class AddNewsSuccess extends AddDeleteNewsState {}

class AddNewsFailure extends AddDeleteNewsState {
  final String errMessage;

  AddNewsFailure(this.errMessage);
}

class DeleteNewsSuccess extends AddDeleteNewsState {}
