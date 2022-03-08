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
            children: [
              SizedBox(
                height: 80,
              ),
              const Text(
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
      margin: EdgeInsets.symmetric(vertical: 14),
      color: Color(0x1AC4C4C4),
      // height: 76,
      child: ListTile(
        title: Text(
          "Room name",
          style: TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        subtitle: Text(
          "Room #122",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: isOccupied ? Color(0x408A77FF) : Color(0x40F9C35C),
          ),
          child: Text(
            isOccupied ? "occupied" : "unoccupied",
            style: TextStyle(
                color: isOccupied ? Color(0xFFB4ADFF) : Color(0xFFF9C35C)),
          ),
          onPressed: () {
            setState(() {
              isOccupied = !isOccupied;
            });
          },
        ),
        onLongPress: () {},
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const RoomEdit()),
          // );
          // Navigator.pushNamed(context, routeName, arguments: );
          Navigator.of(context).pushNamed(RoomEdit.routeName);
        },
      ),
      // child: Text("JIH"),
    );
  }
}
