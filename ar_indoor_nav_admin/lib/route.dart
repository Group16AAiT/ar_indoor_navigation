import 'package:ar_indoor_nav_admin/screens/change_password.dart';
import 'package:ar_indoor_nav_admin/util/building_argument.dart';
import 'package:ar_indoor_nav_admin/util/category_argument.dart';
import 'package:ar_indoor_nav_admin/util/room_edit_argument.dart';
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
              // return const CircularProgressIndicator();
              return const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                  child: SizedBox(
                    height: 30,
                    // width: 30,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
      case CategoriesList.routeName:
        final args = settings.arguments as CategoryArgument;
        return MaterialPageRoute(builder: (context) {
          return CategoriesList(
            bldgId: args.bldgId,
          );
        });

      case AddCategory.routeName:
        final args = settings.arguments as CategoryArgument;
        return MaterialPageRoute(builder: (context) {
          return AddCategory(bldgId: args.bldgId);
        });
      case BuildingList.routeName:
        return MaterialPageRoute(builder: (context) {
          return const BuildingList();
        });
      case BuildingDetail.routeName:
        final bldgArg = settings.arguments as BuildingArgument;
        return MaterialPageRoute(builder: (context) {
          return BuildingDetail(bldgId: bldgArg.bldgId);
        });
      case RoomEdit.routeName:
        final roomArg = settings.arguments as RoomEditArgument;
        return MaterialPageRoute(builder: (context) {
          return RoomEdit(room: roomArg.room);
        });
      case AddAdminPage.routeName:
        return MaterialPageRoute(builder: (context) {
          return AddAdminPage();
        });
      case ChangePassword.routeName:
        return MaterialPageRoute(builder: (context) {
          return ChangePassword();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return LoginPage();
        });
    }
  }
}
