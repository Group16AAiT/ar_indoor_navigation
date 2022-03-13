import 'dart:async';

import 'package:ar_indoor_nav_admin/data/account/repository/account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AccountRepository accountRepository;

  LoginBloc({required this.accountRepository}) : super(InitialLoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      yield LoggingInState();
      await accountRepository.login(event.email, event.password);
      yield LoggedInState();
    } catch (e) {
      print(e);
      yield const ErrorLoggingInState("some error happened while logging");
    }
  }
}
