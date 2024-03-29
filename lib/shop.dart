import 'package:exercise_login_api/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyShop());
}

class MyShop extends StatelessWidget {
  const MyShop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const MyShopPage(),
    );
  }
}

class MyShopPage extends StatefulWidget {
  const MyShopPage({super.key});
  @override
  State<MyShopPage> createState() => _MyShopPageState();
}

class _MyShopPageState extends State<MyShopPage> {
  final List<String> image = <String>[
    "https://static.wixstatic.com/media/5fd7de_00dd725419bb4d9fa05fbbc5b5f31190~mv2.jpg/v1/fill/w_980,h_551,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/5fd7de_00dd725419bb4d9fa05fbbc5b5f31190~mv2.jpg",
    "https://static.wixstatic.com/media/5fd7de_878470d156ed4ba5826390bcc7de5934~mv2.jpg/v1/fill/w_980,h_551,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/5fd7de_878470d156ed4ba5826390bcc7de5934~mv2.jpg",
    "https://static.wixstatic.com/media/5fd7de_795806acfa4647d2a10eaf423048fef8~mv2.jpg/v1/fill/w_980,h_551,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/5fd7de_795806acfa4647d2a10eaf423048fef8~mv2.jpg",
    "https://static.wixstatic.com/media/5fd7de_fba38b1fc7ab45198cd13fa4335e7e64~mv2.jpg/v1/fill/w_980,h_551,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/5fd7de_fba38b1fc7ab45198cd13fa4335e7e64~mv2.jpg",
    "https://static.wixstatic.com/media/5fd7de_bf844fef7b9640b5ae766d1bdf3c3997~mv2.jpg/v1/fill/w_980,h_551,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/5fd7de_bf844fef7b9640b5ae766d1bdf3c3997~mv2.jpg"
  ];
  final List<String> name = <String>[
    "2022 Red Bull RB18 Kit",
    "2020 Mercedes W11 Kit",
    "2008 McLaren MP4-23 Kit",
    "2007 Ferrari F2007 Kit",
    "1988 McLaren MP4/4 Kit"
  ];
  final List<double> price = <double>[65.0, 60.0, 50.0, 50.0, 50.0];
  List<int> quantity = <int>[0, 0, 0, 0, 0];

  double _totalvalue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Shop!'),
        actions: [
          IconButton(
              onPressed: () {
                _totalvalue = 0;
                setState(() {
                  for (int i = 0; i < name.length; i++) {
                    _totalvalue += price[i] * double.parse(quantity[i].toString());
                  }
                });
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("O TOTAL DA COMPRA É ${_totalvalue}"),
                            ElevatedButton(
                              child: const Text('Fechar'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.money)),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MyHomePage(
                              title: "",
                            )));
              },
              icon: Icon(Icons.keyboard_return))
        ],
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: name.length,
          itemBuilder: (BuildContext context, index) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: 270,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    image[index],
                    width: 500,
                    height: 200,
                  ),
                  Text(
                    name[index],
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "R\$: ${price[index].toString()}",
                        style: TextStyle(fontSize: 18, color: Colors.pink),
                      ),
                      SizedBox(
                        width: 70.0,
                        height: 30.0,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                quantity[index] -= 1;
                              });
                            },
                            child: Icon(Icons.remove)),
                      ),
                      Text(
                        "Quantidade: ${quantity[index]}",
                        style: TextStyle(fontSize: 18, color: Colors.pink),
                      ),
                      SizedBox(
                        width: 70.0,
                        height: 30.0,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                quantity[index] += 1;
                              });
                            },
                            child: Icon(Icons.add)),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
