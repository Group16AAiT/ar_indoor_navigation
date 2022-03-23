import 'package:ar_indoor_nav_admin/data/building/bloc/bldg_bloc.dart';
import 'package:ar_indoor_nav_admin/data/building/data_provider/building_data_provider.dart';
import 'package:ar_indoor_nav_admin/data/building/repository/building_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ar_indoor_nav_admin/util/storage/secure_storage.dart';
import 'package:ar_indoor_nav_admin/data/account/account.dart';
import 'package:ar_indoor_nav_admin/route.dart';

import 'package:ar_indoor_nav_admin/data/categories/bloc/bloc.dart';
import 'package:ar_indoor_nav_admin/data/categories/data_provider/category_data.dart';
import 'package:ar_indoor_nav_admin/data/categories/repository/categories_repository.dart';

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

  final BuildingRepository buildingRepository = BuildingRepository(
    buildingDataProvider: BuildingDataProvider(httpClient: http.Client()),
  );
  final CategoriesRepository categoriesRepository = CategoriesRepository(
      dataProvider: CategoriesDataProvider(httpClient: http.Client()));

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
        BlocProvider(
          create: (context) => BldgBloc(buildingRepository: buildingRepository),
        ),
        BlocProvider(
          create: (context) =>
              CategoriesBloc(categoriesRepository: categoriesRepository)
                ..add(const CategoriesLoad()),
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
