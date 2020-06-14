part of 'main_app_bar_bloc.dart';

@immutable
abstract class MainAppBarEvent {}

class SearchButtonPressed extends MainAppBarEvent {}

class TextFieldBackButtonPressed extends MainAppBarEvent {}

class TextFieldSubmitted extends MainAppBarEvent {}
