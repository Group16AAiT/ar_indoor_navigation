import 'package:flutter/material.dart';

class CategoryAdd extends StatefulWidget {
  static const routeName = '/categoryAdd';
  const CategoryAdd({Key? key}) : super(key: key);

  @override
  State<CategoryAdd> createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
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
                "Add Category",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 18),
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
                      children: const [
                        Text(
                          "Enter category Info",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
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
                                  "Category Name",
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
                                  "Category Detail",
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
                    const SizedBox(height: 32),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFF9C35C),
                          // fixedSize: Size(243, 41),
                          fixedSize: const Size(200, 34),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Add Category",
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
