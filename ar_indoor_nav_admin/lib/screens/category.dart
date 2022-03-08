import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double curr_height = MediaQuery.of(context).size.height;
    print("curr r");
    print(curr_height);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14),
      // color: Color(0x1AC4C4C4),
      // height: 76,
      child: Container(
        height: 68,
        child: ListTile(
          tileColor: Color(0x1AC4C4C4),
          title: Text("Category #1",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          trailing: Icon(Icons.cancel_outlined,
              color: Color(
                0xFFD84B4B,
              )),
          onLongPress: () {},
          onTap: () {},
        ),
      ),
      // child: Text("JIH"),
    );
  }
}
