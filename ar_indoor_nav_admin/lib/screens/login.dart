import 'package:ar_indoor_nav_admin/screens/building_list.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0x1A1820FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ListView(children: [
            const SizedBox(
              height: 20,
            ),
            const Image(
              image: AssetImage("assets/images/LockIcon.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                // horizontal: MediaQuery.of(context).size.width * 0.08,
                horizontal: 10,
              ),
              child: Text(
                "Welcome",
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      // fontSize: screenHeight * 0.05,
                      fontSize: 36,
                      color: Colors.white,
                    ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Form(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      "Email",
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            // fontSize: screenHeight * 0.021,
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Poppins Medium',
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0x1AC4C4C4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                      // hintText: 'Email Address',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      "Password",
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            // fontSize: screenHeight * 0.021,
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Poppins Medium',
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0x1AC4C4C4),
                    borderRadius: BorderRadius.circular(20),
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
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFF9C35C),
                  fixedSize: Size(243, 41),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const BuildingList()),
                  // );
                  Navigator.of(context).pushNamed(BuildingList.routeName);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xFF1A1820),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
