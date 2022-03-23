import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ar_indoor_nav_admin/data/categories/bloc/bloc.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<CategoriesBloc, CategoriesState>(builder: (_, state) {
        if (state is CategoriesLoadSuccess) {
          final category = state.categories;
          return Center(
              //margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: category.length,
                  itemBuilder: (_, idx) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        bottomLeft: Radius.circular(32),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 26.0),
                        tileColor: const Color(0x1AC4C4C4),
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: 4),

                        title: Text(category[idx].name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                        // subtitle: Text(
                        //   category[idx].name,
                        // ),

                        trailing: IconButton(
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              context
                                  .read<CategoriesBloc>()
                                  .add(CategoryDelete(category[idx]));
                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     CategoriesList.routeName, (route) => false);
                              // Navigator.pop(context);
                            }),
                      ),
                    );
                  }));
        }
        return const CircularProgressIndicator();
      }),
    );
  }
}
