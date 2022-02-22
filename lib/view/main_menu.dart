import 'package:flutter/material.dart';
import 'package:waktu_solat/view_model/address_view_mode.dart';
import 'package:waktu_solat/view_model/prayer_times_view_model.dart';

class Mainmenu extends StatefulWidget {
  const Mainmenu({Key? key}) : super(key: key);

  @override
  _MainmenuState createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  Map<String, dynamic> prayerDetails = {'name': '', 'different': ''};
  Map<String, dynamic> data = {};

  Future call() async {
    final res = await ListPrayerTimesViewModel().getPrayerTimes();

    setState(() {
      prayerDetails = res['prayerDetails'];
      data = res['prayerTimes'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Color first = Colors.blue[500]!;
    Color second = Colors.blue[800]!;
    const TextStyle textStyle = TextStyle(fontSize: 24, color: Colors.white);

    return SafeArea(
        child: Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FutureBuilder(
                    future: AddressViewModel().getAddress(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('Getting Location...');
                      } else if (snapshot.hasData) {
                        return Text(snapshot.data.toString());
                      } else {
                        return const Text('Failed to get location');
                      }
                    }),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1642150611714-4753eaf53775?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80',
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [second, first],
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80),
                    ),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(5, 10),
                          blurRadius: 20,
                          color: first.withOpacity(0.2))
                    ]),
                child: FutureBuilder(
                  future: call(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.only(left: 14, top: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('data', style: textStyle),
                            const SizedBox(height: 10),
                            Text(prayerDetails['name'], style: textStyle),
                            const SizedBox(height: 10),
                            Text(prayerDetails['different'], style: textStyle),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ))
          ],
        ),
      ),
    ));
  }
}
