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
              height: 10,
            ),
            const Image(
              image: AssetImage("assets/images/LockIcon.png"),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                "Welcome",
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontSize: 36,
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 25),
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
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      "Password",
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFF9C35C),
                  fixedSize: const Size(243, 41),
                ),
                onPressed: () {
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
