import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ar_indoor_nav_admin/util/storage/secure_storage.dart';
import 'package:ar_indoor_nav_admin/data/account/account.dart';
import 'package:ar_indoor_nav_admin/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AccountRepository accountRepository = AccountRepository(
    remoteDataProvider: AccountRemoteDataProvider(httpClient: http.Client()),
    localDataProvider: AccountLocalDataProvider(
      secureStorage: SecureStorage(storage: const FlutterSecureStorage()),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(accountRepository: accountRepository),
        ),
        BlocProvider(
          create: (context) => LoginBloc(accountRepository: accountRepository),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(accountRepository: accountRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        // home: LoginPage(),
        // home: const BuildingList(),
        // home: const CategoryList(),
        initialRoute: "/",
        onGenerateRoute: PageRouter.generateRoute,
      ),
    );
  }
}
