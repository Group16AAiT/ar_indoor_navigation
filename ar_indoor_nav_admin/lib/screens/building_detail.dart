import 'package:ar_indoor_nav_admin/data/bldg_detail/bloc/bldg_detail_bloc.dart';
import 'package:ar_indoor_nav_admin/data/bldg_detail/model/bldg_detail.dart';
import 'package:ar_indoor_nav_admin/data/building/bloc/bldg_bloc.dart';
import 'package:ar_indoor_nav_admin/data/categories/bloc/bloc.dart';
import 'package:ar_indoor_nav_admin/data/room/models/room.dart';
import 'package:ar_indoor_nav_admin/screens/room_edit.dart';
import 'package:ar_indoor_nav_admin/util/room_edit_argument.dart';
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
                BlocBuilder<BldgDetailBloc, BldgDetailState>(
                  builder: (context, state) {
                    if (state is BldgDetailsLoadedState) {
                      final BldgDetail allBldgDetails =
                          state.fetchedBldgDetails;
                      final List<Room> rooms = allBldgDetails.rooms;
                      // return Text("found # ${rooms.length} amount of rooms");
                      return Flexible(
                        child: ListView.builder(
                            itemCount: rooms.length,
                            itemBuilder: (context, index) {
                              final currRoom = rooms[index];
                              return RoomRow(
                                room: currRoom,
                                isOccupied: !currRoom.isEmpty,
                              );
                            }),
                      );
                    } else if (state is ErrorBldgDetailState) {
                      return const Text(
                        "error loading detailss ? ",
                        style: TextStyle(color: Colors.white),
                      );
                    } else if (state is BldgDetailLoadingState) {
                      return Column(
                        children: const [
                          SizedBox(height: 48),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                              child: SizedBox(
                                height: 30,
                                // width: 30,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    // InitialBldgState
                    return const Text("HI",
                        style: TextStyle(color: Colors.white));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoomRow extends StatefulWidget {
  final Room room;
  bool isOccupied;
  RoomRow({
    Key? key,
    required this.room,
    required this.isOccupied,
  }) : super(key: key);

  @override
  State<RoomRow> createState() => _RoomRowState();
}

class _RoomRowState extends State<RoomRow> {
  // bool isOccupied = true;
  // bool isOccupied = isOccupied;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.symmetric(vertical: 14),
      color: const Color(0x1AC4C4C4),
      // height: 76,
      child: ListTile(
        title: Text(
          "Room name ${widget.room.roomName}",
          style: const TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        subtitle: Text(
          "Room #${widget.room.roomNumber}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: widget.isOccupied
                ? const Color(0x408A77FF)
                : const Color(0x40F9C35C),
          ),
          child: Text(
            widget.isOccupied ? "occupied" : "unoccupied",
            style: TextStyle(
                color: widget.isOccupied
                    ? const Color(0xFFB4ADFF)
                    : const Color(0xFFF9C35C)),
          ),
          onPressed: () {
            setState(() {
              //TODO: implement or make ElevatedButton Text widget
            });
          },
        ),
        onLongPress: () {},
        onTap: () async {
          BlocProvider.of<CategoriesBloc>(context).add(const CategoriesLoad());
          final updatedRoom = await Navigator.of(context).pushNamed(
            RoomEdit.routeName,
            arguments: RoomEditArgument(room: widget.room),
          );

          if (updatedRoom.runtimeType == Room) {
            setState(() {
              widget.isOccupied = !(updatedRoom as Room).isEmpty;
            });
          }
          // print("runtime type " + updatedRoom.runtimeType.toString());
        },
      ),
    );
  }
}
