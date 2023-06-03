import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:house_tech/services/cart_provider.dart';
import 'package:provider/provider.dart';

import '../widget/appbar_view.dart';
import '../widget/footers/footer.dart';

class ShoppingCardScreen extends StatelessWidget {
  const ShoppingCardScreen({super.key});
  static const routeName = '/shopping-cart';

  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<CartProvider>(context).cartItems;
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
                    ' Savat',
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 150, right: 150, bottom: 20),
              child: Divider(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 150, right: 150),
              child: Text('Savat'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150, right: 150, top: 20),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: carts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      context.goNamed(
                        '/product-info',
                        extra: carts[index].id,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                height: 200,
                                width: 220,
                                child: Image.network(
                                  carts[index].image,
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
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              child: Text(
                                carts[index].name.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 120,
                          padding: const EdgeInsets.all(13.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${carts[index].price}',
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
                              const InkWell(
                                child: Row(
                                  children: [
                                    Icon(Icons.delete),
                                    Text(
                                      'O\'chirish',
                                    ),
                                  ],
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
