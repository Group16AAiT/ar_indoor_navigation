import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ar_indoor_nav_admin/data/account/bloc/bloc.dart';
import 'package:ar_indoor_nav_admin/data/account/data_provider/data_provider.dart';
import 'package:ar_indoor_nav_admin/data/account/repository/account_repository.dart';
import 'package:ar_indoor_nav_admin/data/categories/bloc/bloc.dart';
import 'package:ar_indoor_nav_admin/util/storage/secure_storage.dart';
import 'package:ar_indoor_nav_admin/screens/building_detail.dart';
import 'package:ar_indoor_nav_admin/screens/building_list.dart';
import 'package:ar_indoor_nav_admin/screens/category_add.dart';
import 'package:ar_indoor_nav_admin/screens/category_list.dart';
import 'package:ar_indoor_nav_admin/screens/login.dart';
import 'package:ar_indoor_nav_admin/screens/add_admin.dart';
import 'package:ar_indoor_nav_admin/screens/room_edit.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings) {
    final AccountRepository accountRepository = AccountRepository(
      remoteDataProvider: AccountRemoteDataProvider(httpClient: http.Client()),
      localDataProvider: AccountLocalDataProvider(
        secureStorage: SecureStorage(storage: const FlutterSecureStorage()),
      ),
    );
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) {
          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is UnAuthenticatedState) {
                return BlocProvider(
                  create: (context) =>
                      LoginBloc(accountRepository: accountRepository),
                  child: LoginPage(),
                );
              }
              if (state is AuthenticatedState) {
                return const BuildingList();
              }
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationEvent.getAuthState);
              return const CircularProgressIndicator();
            },
          );
        });
      case CategoriesList.routeName:
        return MaterialPageRoute(builder: (context) {
          return BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (_, state) {
            if (state is CategoriesLoadSuccess) {
              return const CategoriesList();
            }
            // if (state is CategoriesOperationError) {
            //   return const Text("data");
            // }

            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                  CircularProgressIndicator(
                    backgroundColor: Color.fromARGB(255, 69, 65, 83),
                    valueColor: AlwaysStoppedAnimation(
                        Color.fromARGB(255, 184, 178, 167)),
                    strokeWidth: 7,
                  ),
                ]));
          });
        });

      case AddCategory.routeName:
        return MaterialPageRoute(builder: (context) {
          return const AddCategory();
        });
      case BuildingList.routeName:
        return MaterialPageRoute(builder: (context) {
          return const BuildingList();
        });
      case BuildingDetail.routeName:
        return MaterialPageRoute(builder: (context) {
          return const BuildingDetail();
        });
      case RoomEdit.routeName:
        return MaterialPageRoute(builder: (context) {
          return const RoomEdit();
        });
      case AddAdminPage.routeName:
        return MaterialPageRoute(builder: (context) {
          return AddAdminPage();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return LoginPage();
        });
    }
  }
}
