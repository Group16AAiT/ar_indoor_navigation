import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double currHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      // color: Color(0x1AC4C4C4),
      // height: 76,
      child: SizedBox(
        height: 68,
        child: ListTile(
          tileColor: const Color(0x1AC4C4C4),
          title: const Text("Category #1",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          trailing: const Icon(Icons.cancel_outlined,
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
