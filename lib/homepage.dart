import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double ergebnis = 0;
  double gewichtSliderValue = 80;
  double groesseSliderValue = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Rechner'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text('Gewicht'),
              Expanded(
                child: Slider(
                    value: gewichtSliderValue,
                    min: 1,
                    max: 200,
                    divisions: 199,
                    label: gewichtSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        gewichtSliderValue = value;
                        final groesse = groesseSliderValue / 100;
                        ergebnis = gewichtSliderValue / (groesse * groesse);
                        print(ergebnis);
                      });
                    }),
              ),
            ],
          ),
          Row(
            children: [
              Text('Groesse'),
              Expanded(
                child: Slider(
                    value: groesseSliderValue,
                    min: 80,
                    max: 230,
                    divisions: 150,
                    label: groesseSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        groesseSliderValue = value;
                        final groesse = groesseSliderValue / 100;
                        ergebnis = gewichtSliderValue / (groesse * groesse);
                        print(ergebnis);
                      });
                    }),
              ),
            ],
          ),
          Text(ergebnis.toStringAsFixed(1)),
        ],
      ),
    );
  }
}
