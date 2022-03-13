import 'package:ar_indoor_nav_admin/screens/add_admin.dart';
import 'package:ar_indoor_nav_admin/screens/building_detail.dart';
import 'package:ar_indoor_nav_admin/screens/category_list.dart';
import 'package:flutter/material.dart';

class BuildingList extends StatelessWidget {
  static const routeName = "/buildingList";
  const BuildingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF1A1820),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 94,
                ),
                const Text(
                  "Buildings",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          CategoryList.routeName,
                        );
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Text(
                          'Manage Categories',
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AddAdminPage.routeName,
                          );
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: Text(
                            'Add Admin',
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
                  ],
                ),
                const SizedBox(height: 32),
                const BuildingRow(),
                const BuildingRow(),
                const BuildingRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildingRow extends StatefulWidget {
  const BuildingRow({Key? key}) : super(key: key);

  @override
  State<BuildingRow> createState() => _BuildingRowState();
}

class _BuildingRowState extends State<BuildingRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      // color: Colors.amber,
      color: const Color(0x1AC4C4C4),
      // height: 76,
      child: ListTile(
        title: const Text(
          "Building #1",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        subtitle: const Text(
          "Location",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_sharp,
          color: Colors.white,
        ),
        onLongPress: () {},
        onTap: () {
          Navigator.of(context).pushNamed(
            BuildingDetail.routeName,
          );
        },
      ),
      // child: Text("JIH"),
    );
  }
}
