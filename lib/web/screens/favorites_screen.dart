import 'package:house_tech/services/like_provider.dart';
import 'package:provider/provider.dart';

import '/web/widget/appbar_view.dart';
import '../widget/footers/footer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  static const routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    final likes = Provider.of<LikeProvider>(context, listen: false).likeItems;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: primaryColor,
        toolbarHeight: 122,
        title: AppBarView(),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: InkWell(
                      onTap: () {
                        context.goNamed('/home');
                      },
                      child: const Text(
                        'Asosiy /',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Text(
                    ' Sevimlilar',
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 150, right: 150),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 65, right: 65, top: 20),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: likes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 0.5, mainAxisSpacing: 20, crossAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return InkWell(
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      context.goNamed(
                        '/product-info',
                        extra: likes[index].id,
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
                                  likes[index].image,
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
                            likes[index].name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 220,
                          // padding: const EdgeInsets.all(13.0),
                          child: Text(
                            likes[index].description,
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
                                '${likes[index].price}',
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
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.blue,
              child: const Footer(),
            )
          ],
        ),
      ),
    );
  }
}
