import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/product_model.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/order_summary.dart';
import '../../widgets/order_summary_product_card.dart';

class OrderComfirmationScreen extends StatelessWidget {
  const OrderComfirmationScreen({super.key});
  static const String routeName = '/order_confirmation';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OrderComfirmationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Order Confirmation",
        action: Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 170,
                ),
                Positioned(
                  top: 30,
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  child: SvgPicture.asset(
                    "assets/svgs/garlands.svg",
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  top: 140,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Your order is complete",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(thickness: 2),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ORDER CODE: #k321-ekd3",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Thank you for purchasing on Zero To unicorn.",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Zero To unicorn",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const OrderSummary(),
                  const SizedBox(height: 20),
                  Text(
                    "ORDER DETAIL",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 5),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      OrderSummaryProductCard(
                        product: Product.products[0],
                        quantity: 2,
                      ),
                      OrderSummaryProductCard(
                        product: Product.products[0],
                        quantity: 2,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
