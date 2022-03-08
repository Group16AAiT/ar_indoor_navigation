import 'package:flutter/material.dart';

class RoomEdit extends StatefulWidget {
  static const routeName = '/roomEdit';
  const RoomEdit({Key? key}) : super(key: key);

  @override
  State<RoomEdit> createState() => _RoomEditState();
}

class _RoomEditState extends State<RoomEdit> {
  bool isOccupied = false;

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
              const SizedBox(height: 80),
              const Text(
                "Room #112A",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isOccupied = !isOccupied;
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Text(
                      isOccupied
                          ? 'Make room unoccupied'
                          : "Make room occupied",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  // textColor: Colors.white,
                  style: TextButton.styleFrom(
                    // primary: Color(0xFFF9C35C),
                    primary: isOccupied
                        ? const Color(0xFFD84B4B)
                        : const Color(0xFFF9C35C),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: isOccupied
                                ? const Color(0xFFD84B4B)
                                : const Color(0xFFF9C35C),
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Container(
                height: 360,
                color: const Color(0x1AC4C4C4),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(children: [
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Room #1223",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: isOccupied
                                ? const Color(0x408A77FF)
                                : const Color(0x40F9C35C),
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
                      ],
                    ),
                    const SizedBox(height: 24),
                    Form(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Room Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(
                                        // fontSize: screenHeight * 0.021,
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Poppins Medium',
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: const Color(0x1AC4C4C4),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextFormField(
                                initialValue: '',
                                decoration: const InputDecoration(
                                  // hintText: 'Email Address',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Room Category",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: const Color(0x1AC4C4C4),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextFormField(
                                initialValue: '',
                                decoration: const InputDecoration(
                                  // hintText: 'Password',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFF9C35C),
                          // fixedSize: Size(243, 41),
                          fixedSize: const Size(200, 34),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Save Changes",
                          style: TextStyle(
                            color: Color(0xFF1A1820),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
