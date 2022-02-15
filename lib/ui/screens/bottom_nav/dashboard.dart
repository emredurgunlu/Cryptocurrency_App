import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../widgets/graph.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height / 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Balance Summary",
                        style: TextStyle(color: Colors.indigo.withOpacity(0.7)),
                      ),
                      const Text(
                        "20 July - 27 July 2020",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const LineChartSample2(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Top Cryptocurreny",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "More",
                        style: TextStyle(
                          color: Colors.indigo.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        coinContainer(
                            "120 bit", Colors.amber, "images/bitcoin.png"),
                        coinContainer(
                            "120 bit",
                            const Color.fromARGB(255, 127, 112, 211),
                            "images/etherium.png"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.indigo,
                shape: BoxShape.rectangle,
              ),
              height: Get.height / 4,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good Morning",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              const Text(
                                "David Kowalski",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                const Icon(
                                  Icons.notifications_none_outlined,
                                  color: Colors.white,
                                ),
                                Positioned(
                                  right: 0.1,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 223, 140, 167),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "\$ 45.500,12",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "Your main balance",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      const Flexible(child: SizedBox(height: 25)),
                    ],
                  ),
                  Positioned(
                    top: (Get.height / 4) - 30,
                    right: 5,
                    left: 5,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 100,
                                child: Row(
                                  children: const [
                                    Icon(Icons.attach_money_outlined),
                                    Text("Transfer"),
                                  ],
                                )),
                            onTap: () {
                              if (Get.height > Get.width) {
                                Get.toNamed('/transfer');
                              } else {
                                Get.toNamed('/transfer_landscape');
                              }
                            },
                          ),
                          const SizedBox(width: 50),
                          InkWell(
                            child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 100,
                                child: Row(
                                  children: const [
                                    Icon(Icons.attach_money_outlined),
                                    Text("Withdraw"),
                                  ],
                                )),
                            onTap: () {
                              Get.toNamed('/transfer');
                            },
                          ),
                        ],
                      ),
                      color: Colors.white,
                      elevation: 5,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding coinContainer(
    String value,
    Color boxColor,
    String cryptoIcon,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
      child: Container(
        width: 250,
        height: 100,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(cryptoIcon, width: 30, height: 30),
                ),
              ],
            ),
            const Text(
              "Bitcoin Balance",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
