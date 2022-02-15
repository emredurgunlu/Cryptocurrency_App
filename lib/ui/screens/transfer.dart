import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/transfer_money.dart';

class Transfer extends StatelessWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransferMoney m = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.indigo,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Transfer",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "\$ 450.500,24",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 207, 135, 159)),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Main Wallet",
                      style: TextStyle(color: Colors.white.withOpacity(0.3)),
                    ),
                    Text(
                      "Change",
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    )
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: Get.width,
              height: Get.height / 1.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "\$ ${m.selectedMoney.value}",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                    Text(
                      "Transfer Amount",
                      style: stil(),
                    ),
                    moneyRow(m, "50", "100", "200"),
                    moneyRow(m, "400", "700", "1000"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Receiver",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "More",
                          style: stil(),
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 150,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            profil("Julia"),
                            profil("Andrew"),
                            profil("Susan"),
                            profil("James"),
                            profil("Bella"),
                            profil("Emre"),
                            profil("Hasan"),
                            profil("Mehmet"),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("SEND"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          minimumSize: const Size.fromHeight(50)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle stil() {
    return TextStyle(
        fontWeight: FontWeight.bold, color: Colors.indigo.withOpacity(0.8));
  }

  Padding profil(String name) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset("images/profil200.jpg", height: 100, width: 100),
          ),
          Text(name, style: stil()),
        ],
      ),
    );
  }

  Row moneyRow(
    TransferMoney m,
    String first,
    String second,
    String third,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        moneyButton(m, first),
        moneyButton(m, second),
        moneyButton(m, third),
      ],
    );
  }

  ElevatedButton moneyButton(TransferMoney m, String money) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: (m.selectedMoney.value == money) ? Colors.indigo : Colors.grey,
        minimumSize: const Size(100, 30),
      ),
      onPressed: () {
        m.selectedMoney.value = money;
      },
      child: Text(money),
    );
  }
}
