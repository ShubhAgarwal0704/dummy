// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hotel_app/model/cart.dart';
import 'package:hotel_app/model/hotel.dart';
import 'package:hotel_app/screens/home_screen.dart';
import 'package:hotel_app/screens/order/checkout_screen.dart';
import 'package:hotel_app/themes/hotel_app_theme.dart';
import 'package:hotel_app/widgets/general/app_bar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void handleRemoveFromCart(Hotel hotel) {
    Provider.of<Cart>(context, listen: false).removeHotelFromCart(hotel);

// alert the user
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text("Reserving removed"),
              content: Text("Check your cart"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: HotelAppTheme.buildLightTheme(),
        child: Container(
          child: Scaffold(
              backgroundColor:
                  HotelAppTheme.buildLightTheme().colorScheme.tertiary,
              body: Consumer<Cart>(
                  builder: (context, value, child) => Column(children: <Widget>[
                        CustomAppBar(title: "Cart"),
                        Expanded(
                            child: value.getUserCart().isEmpty
                                ? Center(
                                    child: Text(
                                    "Your cart is empty.",
                                    style: TextStyle(color: Colors.white),
                                  ))
                                : ListView.builder(
                                    itemCount: value.getUserCart().length,
                                    itemBuilder: ((context, index) {
                                      Hotel hotel = value.getUserCart()[index];

                                      return CartItem(
                                        hotel: hotel,
                                        removeFromCart: handleRemoveFromCart,
                                      );
                                    }),
                                  )),
                        Container(
                          width: 220,
                          padding: EdgeInsets.only(top: 12, bottom: 30),
                          child: value.getUserCart().isEmpty
                              ? ElevatedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        HotelAppTheme.buildLightTheme()
                                            .colorScheme
                                            .secondary),
                                  ),
                                  onPressed: () {
                                    Navigator.push<dynamic>(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) =>
                                            HotelHomeScreen(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: HotelAppTheme.buildLightTheme()
                                        .colorScheme
                                        .primary,
                                  ),
                                  label: Text(
                                    "Reverse Hotels",
                                    style: TextStyle(
                                        color: HotelAppTheme.buildLightTheme()
                                            .colorScheme
                                            .primary),
                                  ))
                              : ElevatedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        HotelAppTheme.buildLightTheme()
                                            .colorScheme
                                            .secondary),
                                  ),
                                  onPressed: () {
                                    Navigator.push<dynamic>(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) =>
                                            CheckoutScreen(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: HotelAppTheme.buildLightTheme()
                                        .colorScheme
                                        .primary,
                                  ),
                                  label: Text(
                                    "Checkout",
                                    style: TextStyle(
                                        color: HotelAppTheme.buildLightTheme()
                                            .colorScheme
                                            .primary),
                                  ),
                                ),
                        )
                      ]))),
        ));
  }
}

class CartItem extends StatelessWidget {
  final Hotel hotel;
  final Function(Hotel) removeFromCart;

  const CartItem({Key? key, required this.hotel, required this.removeFromCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalDays(Hotel hotel) {
      final end = hotel.endDate;
      final start = hotel.startDate;
      final difference = 0;
      // final difference = end!.difference(start!).inDays;
      return difference;
    }

//mkc
    String getFormatted(Hotel hotel) {
      // var formatted = Jiffy.parseFromDateTime(hotel.startDate!).yMMMMd;
      return "";
      // return  formatted + " (+${totalDays(hotel)} days)";
    }

    return Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        padding: const EdgeInsets.all(12.0),
        margin: EdgeInsets.only(top: 12, left: 16, right: 16.0),
        decoration: BoxDecoration(
          color: HotelAppTheme.buildLightTheme().colorScheme.secondary,
          borderRadius: BorderRadius.all(Radius.circular(18)),
          border: Border.all(
            color: Color(0xff00A1FF),
          ),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9.0),
                    child: Image.network(
                        "https://images.unsplash.com/photo-1625244724120-1fd1d34d00f6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        height: 80,
                        width: 120,
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hotel.titleTxt,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.date_range,
                                color: Colors.white70.withOpacity(0.5)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "09/03/2024",
                              // getFormatted(hotel) ?? "no dates",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.people,
                              color: Colors.white70.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              (hotel.people ?? 3).toString() + " people",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "\₹" + (hotel.perMonth * totalDays(hotel)).toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color:
                                  HotelAppTheme.buildLightTheme().primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        Text(
                          "/Month",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Spacer(),
                    TextButton.icon(
                        onPressed: () => removeFromCart(hotel),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.red)),
                        icon: Icon(Icons.delete_outline_rounded),
                        label: Text("Remove")),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
