import 'package:ar_indoor_nav_admin/screens/category.dart';
import 'package:ar_indoor_nav_admin/screens/category_add.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  static const routeName = "/categories";
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF1A1820),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 94,
                ),
                const Text(
                  "Manage Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        CategoryAdd.routeName,
                      );
                    },
                    label: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: const Text(
                        'Add category',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // textColor: Colors.white,
                    style: TextButton.styleFrom(
                      primary: const Color(0xFFF9C35C),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color(0xFFF9C35C),
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Category(),
                const Category(),
                const Category(),
                const Category(),
                const Category()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
