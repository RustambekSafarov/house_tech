import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../services/get_service.dart';

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          FutureBuilder(
            future: getCatalog(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.4, crossAxisSpacing: 10, mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return InkWell(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          context.goNamed('/catalog-detail', extra: snapshot.data![index]['id']);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              snapshot.data![index]['img_url'],
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SpinKitHourGlass(
                    color: Colors.black,
                    size: 30,
                  ),
                );
              } else {
                return const Center(child: Text('Network Error!'));
              }
            },
          )
        ],
      ),
    );
  }
}
