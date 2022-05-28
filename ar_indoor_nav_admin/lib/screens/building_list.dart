import 'package:ar_indoor_nav_admin/data/bldg_detail/bloc/bldg_detail_bloc.dart';
import 'package:ar_indoor_nav_admin/data/building/bloc/bldg_bloc.dart';
import 'package:ar_indoor_nav_admin/data/building/model/building.dart';
import 'package:ar_indoor_nav_admin/screens/add_admin.dart';
import 'package:ar_indoor_nav_admin/screens/building_detail.dart';
import 'package:ar_indoor_nav_admin/screens/category_list.dart';
import 'package:ar_indoor_nav_admin/screens/change_password.dart';
import 'package:ar_indoor_nav_admin/util/building_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                        ChangePassword.routeName,
                      );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Text(
                        // 'Manage Categories',
                        'Change password',
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
              // const BuildingRow(),
              // const BuildingRow(),
              // const BuildingRow(),

              BlocBuilder<BldgBloc, BldgState>(
                builder: (context, state) {
                  if (state is BldgLoadingState) {
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
                  } else if (state is AllBldgLoadedState) {
                    final allFetchedBldgs = state.fetchedbldgs;
                    return Flexible(
                      child: ListView.builder(
                          itemCount: allFetchedBldgs.length,
                          itemBuilder: (context, index) {
                            final currBldg = allFetchedBldgs[index];
                            return BuildingRow(
                              building: currBldg,
                            );
                          }),
                    );
                  } else if (state is ErrorBldgState) {
                    return Text(
                      "Errorrr happened ${state.message}",
                      style: const TextStyle(color: Colors.white),
                    );
                  } else if (state is InitialBldgState) {
                    BlocProvider.of<BldgBloc>(context)
                        .add(const GetBuildings());
                  }
                  // InitialBldgState
                  // BldgDetailsLoadedState
                  // BlocProvider.of<BldgBloc>(context).add(const GetBuildings());
                  return const Text("");
                },
              ),

              BlocBuilder<BldgBloc, BldgState>(
                builder: (context, state) {
                  if (state is ErrorBldgState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFF9C35C),
                          fixedSize: const Size(243, 41),
                        ),
                        onPressed: () {
                          BlocProvider.of<BldgBloc>(context)
                              .add(const GetBuildings());
                        },
                        child: const Text(
                          "Try again",
                          style: TextStyle(
                            color: Color(0xFF1A1820),
                          ),
                        ),
                      ),
                    );
                  }
                  return const Text("");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildingRow extends StatefulWidget {
  final Building building;
  const BuildingRow({Key? key, required this.building}) : super(key: key);

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
        title: Text(
          // "Building #1",
          "${widget.building.name}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          // "Location",
          "${widget.building.location}",
          style: const TextStyle(
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
          BlocProvider.of<BldgDetailBloc>(context)
              .add(GetBuildingDetails(id: widget.building.id));

          Navigator.of(context).pushNamed(
            BuildingDetail.routeName,
            arguments: BuildingArgument(bldgId: widget.building.id),
          );
        },
      ),
      // child: Text("JIH"),
    );
  }
}
