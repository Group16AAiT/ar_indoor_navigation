import 'package:ar_indoor_nav_admin/screens/building_detail.dart';
import 'package:ar_indoor_nav_admin/screens/building_list.dart';
import 'package:ar_indoor_nav_admin/screens/category_list.dart';
import 'package:ar_indoor_nav_admin/screens/login.dart';
import 'package:ar_indoor_nav_admin/screens/room_edit.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) {
          return LoginPage();
        });
      case CategoryList.routeName:
        return MaterialPageRoute(builder: (context) {
          // String email = settings.arguments as String;
          return CategoryList();
        });
      case BuildingList.routeName:
        return MaterialPageRoute(builder: (context) {
          return BuildingList();
        });
      case BuildingDetail.routeName:
        return MaterialPageRoute(builder: (context) {
          return BuildingDetail();
        });
      case RoomEdit.routeName:
        return MaterialPageRoute(builder: (context) {
          return RoomEdit();
        });
    }
  }
}
