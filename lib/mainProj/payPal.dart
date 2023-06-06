import 'package:flutter/material.dart';
import 'package:main2/mainProj/profile.dart';

void main() => runApp(PayPal(
      fee: "2000",
    ));

// ignore: must_be_immutable
class PayPal extends StatefulWidget {
  String? fee;
  PayPal({Key? key, required this.fee}) : super(key: key);

  @override
  State<PayPal> createState() => _PayPalState();
}

class _PayPalState extends State<PayPal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 207, 206, 206),
        body: PayPalBody(
          fee: widget.fee,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PayPalBody extends StatefulWidget {
  String? fee;
  PayPalBody({Key? key, required this.fee}) : super(key: key);

  @override
  State<PayPalBody> createState() => _PayPalBodyState();
}

class _PayPalBodyState extends State<PayPalBody> {
  double? accountMoney;
  double? fee;
  String? inputCardNumber1;
  String? inputCardNumber2;
  String? inputCardNumber3;
  String? inputCardNumber4;
  String Cardnumber = "0000";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          Container(
            height: height / 2,
            margin: EdgeInsets.only(left: 10, right: 10, top: height / 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Payying",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                SizedBox(
                  height: height / 20,
                ),
                Container(
                  width: double.maxFinite,
                  height: height / 10,
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(
                    elevation: 5,
                    child: Row(
                      children: [
                        SizedBox(
                          width: width / 30,
                        ),
                        const Text("Fee: "),
                        SizedBox(
                          width: width / 5,
                        ),
                        Text(widget.fee!)
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: height / 10,
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(
                    elevation: 5,
                    child: Row(
                      children: [
                        SizedBox(
                          width: width / 30,
                        ),
                        const Text("Card number: "),
                        SizedBox(
                          width: width / 5,
                        ),
                        Container(
                          height: 40,
                          color: Colors.grey,
                          width: 30,
                          child: TextFormField(
                            onChanged: (newValue) {
                              inputCardNumber1 = newValue;
                            },
                            validator: (value) {
                              if (value == null) {
                                return "";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          color: Colors.grey,
                          width: 30,
                          child: TextFormField(
                            onChanged: (newValue) {
                              inputCardNumber2 = newValue;
                            },
                            validator: (value) {
                              if (value == null) {
                                return "";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          color: Colors.grey,
                          width: 30,
                          child: TextFormField(
                            onChanged: (newValue) {
                              inputCardNumber3 = newValue;
                            },
                            validator: (value) {
                              if (value == null) {
                                return "";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          color: Colors.grey,
                          width: 30,
                          child: TextFormField(
                            onChanged: (newValue) {
                              inputCardNumber4 = newValue;
                            },
                            validator: (value) {
                              if (value == null) {
                                return "";
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    height: height / 10,
                    decoration: BoxDecoration(
                      // color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        String inputCardNumber = inputCardNumber1! +
                            inputCardNumber2! +
                            inputCardNumber3! +
                            inputCardNumber4!;

                        // ignore: unrelated_type_equality_checks
                        if (inputCardNumber != Cardnumber) {
                          const snackBar = SnackBar(
                              content: Text("Not a Correct Card Password"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const profile(),
                            ),
                          );
                        } else if (accountMoney! > fee!) {
                          const snackBar =
                              SnackBar(content: Text("Succesfully Purchased"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const profile(),
                            ),
                          );
                        } else if (accountMoney! < fee!) {
                          const snackBar =
                              SnackBar(content: Text("Not Enough Money"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const profile(),
                            ),
                          );
                        }
                      },
                      child: const Text("Purchasing"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
