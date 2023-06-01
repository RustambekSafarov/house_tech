import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../services/get_service.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFavorite(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, index) => InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                context.goNamed(
                  '/product-info',
                  extra: snapshot.data![index]['id'],
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: 220,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border),
                            ),
                          ),
                          Image.network(
                            snapshot.data![index]['img_url'],
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Image.network(
                                'https://telegra.ph/file/a775320534f348ae7f531.png',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Text(
                      snapshot.data![index]['name'].toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 220,
                    // padding: const EdgeInsets.all(13.0),
                    child: Text(
                      snapshot.data![index]['discrpition'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${snapshot.data![index]['price']}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          ' so\'m',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 450,
            child: Center(
              child: SpinKitHourGlass(
                color: Colors.black,
                size: 30,
              ),
            ),
          );
        } else {
          return const SizedBox(
            height: 400,
            child: Center(
              child: Text('Network Error!'),
            ),
          );
        }
      },
    );
  }
}
