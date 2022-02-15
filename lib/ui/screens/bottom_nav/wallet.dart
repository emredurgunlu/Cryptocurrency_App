import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Text(
              "Wallet",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: PageView(children: [
              moneyCard(
                "Main Wallet",
                "\$ 450.500,24",
                "444 221 224 ***",
              ),
              moneyCard(
                "Second Wallet",
                "\$ 250.500,00",
                "555 222 888 ***",
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Others",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.add,
                    size: 15,
                  ),
                  Text(
                    " Add",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 40,
              children: <Widget>[
                spending(
                    "Monthly", "\$ 2.500,42", "Restaurant", 0.75, Colors.green),
                spending(
                    "Yearly", "\$ 30.500,42", "Investment", 0.45, Colors.red),
                spending("Monthly", "\$ 3.400,42", "Restaurant", 0.30,
                    Colors.blueAccent),
                spending("Yearly", "\$ 25.500,42", "Investment", 0.90,
                    const Color.fromARGB(255, 116, 192, 216)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container spending(
      String time, String money, String place, double circle, Color boxColor) {
    return Container(
      width: 140,
      height: 250,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularProgressIndicator(
            value: circle,
            backgroundColor: Colors.white.withOpacity(0.3),
            color: Colors.white,
          ),
          Text(
            time,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          Text(
            money,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            place,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  Align moneyCard(String name, String money, String number) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 150,
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style: TextStyle(color: Colors.indigo.shade100),
              ),
              Text(
                money,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    number,
                    style: const TextStyle(color: Colors.amber),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned(
                        right: -20,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ]),
      ),
    );
  }
}
