import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController moeda = TextEditingController();
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double real = 0.0;
  double dolar = 0.0;
  double euro = 0.0;

  @override
  void initState() {
    super.initState();
  }

  int converterController() {
    return int.parse(moeda.value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(193, 0, 126, 1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/logo_home.png"),
              const Padding(padding: EdgeInsets.all(20)),
              const Center(
                child: Text(
                  "Conversor de Moedas",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          iconTheme: const IconThemeData(color: Colors.indigo),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 100, left: 30, right: 30, bottom: 20),
              child: Column(children: [
                Image.asset(
                  'assets/Vector.png',
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: realController,
                  decoration: const InputDecoration(
                    labelText: 'Valor em Reais',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      real = double.tryParse(value) ?? 0.0;
                      dolarController.text = (real / 5).toStringAsFixed(2);
                      euroController.text = (real / 6).toStringAsFixed(2);
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: dolarController,
                  decoration: const InputDecoration(
                    labelText: 'Valor em Dólares',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      dolar = double.tryParse(value) ?? 0.0;
                      realController.text = (dolar * 5).toStringAsFixed(2);
                      euroController.text = (dolar * 5 / 6).toStringAsFixed(2);
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: euroController,
                  decoration: const InputDecoration(
                    labelText: 'Valor em Euros',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      euro = double.tryParse(value) ?? 0.0;
                      realController.text = (euro * 6).toStringAsFixed(2);
                      dolarController.text = (euro * 6 / 5).toStringAsFixed(2);
                    });
                  },
                ),
              ]),
            ),
          ),
        ));
  }
}