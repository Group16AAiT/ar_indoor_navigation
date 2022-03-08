import 'package:ar_indoor_nav_admin/screens/building_detail.dart';
import 'package:ar_indoor_nav_admin/screens/building_list.dart';
import 'package:ar_indoor_nav_admin/screens/category_add.dart';
import 'package:ar_indoor_nav_admin/screens/category_list.dart';
import 'package:ar_indoor_nav_admin/screens/login.dart';
import 'package:ar_indoor_nav_admin/screens/room_edit.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) {
          return const LoginPage();
        });
      case CategoryList.routeName:
        return MaterialPageRoute(builder: (context) {
          // String email = settings.arguments as String;
          return const CategoryList();
        });
      case CategoryAdd.routeName:
        return MaterialPageRoute(builder: (context) {
          return const CategoryAdd();
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
      default:
        return MaterialPageRoute(builder: (context) {
          return const LoginPage();
        });
    }
  }
}
