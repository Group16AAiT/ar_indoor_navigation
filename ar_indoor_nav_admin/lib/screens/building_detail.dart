import 'package:ar_indoor_nav_admin/data/building/bloc/bldg_bloc.dart';
import 'package:ar_indoor_nav_admin/screens/room_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildingDetail extends StatelessWidget {
  static const routeName = "/buildingDetail";
  const BuildingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<BldgBloc>(context).add(const GetBuildings());
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1A1820),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                BlocBuilder<BldgBloc, BldgState>(
                  builder: (context, state) {
                    if (state is BldgDetailsLoadedState) {
                      return Text(
                        "Building # {${state.fetchedbldg.name}}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 36,
                        ),
                      );
                    } else if (state is ErrorBldgState) {
                      return const Text(
                        "error loading detailss ? ",
                        style: TextStyle(color: Colors.white),
                      );
                    } else if (state is BldgLoadingState) {
                      return const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      );
                    }
                    // InitialBldgState
                    return const Text("HI",
                        style: TextStyle(color: Colors.white));
                  },
                ),
                const RoomRow(),
                const RoomRow(),
                const RoomRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoomRow extends StatefulWidget {
  const RoomRow({Key? key}) : super(key: key);

  @override
  State<RoomRow> createState() => _RoomRowState();
}

class _RoomRowState extends State<RoomRow> {
  bool isOccupied = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.symmetric(vertical: 14),
      color: const Color(0x1AC4C4C4),
      // height: 76,
      child: ListTile(
        title: const Text(
          "Room name",
          style: TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        subtitle: const Text(
          "Room #122",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary:
                isOccupied ? const Color(0x408A77FF) : const Color(0x40F9C35C),
          ),
          child: Text(
            isOccupied ? "occupied" : "unoccupied",
            style: TextStyle(
                color: isOccupied
                    ? const Color(0xFFB4ADFF)
                    : const Color(0xFFF9C35C)),
          ),
          onPressed: () {
            setState(() {
              isOccupied = !isOccupied;
            });
          },
        ),
        onLongPress: () {},
        onTap: () {
          Navigator.of(context).pushNamed(RoomEdit.routeName);
        },
      ),
    );
  }
}
