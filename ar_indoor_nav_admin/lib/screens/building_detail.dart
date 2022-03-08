import 'package:ar_indoor_nav_admin/screens/room_edit.dart';
import 'package:flutter/material.dart';

class BuildingDetail extends StatelessWidget {
  static const routeName = "/buildingDetail";
  const BuildingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1820),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 80),
              Text(
                "Building #1",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              RoomRow(),
              RoomRow(),
              RoomRow(),
            ],
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
