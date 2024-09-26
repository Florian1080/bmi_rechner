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
      backgroundColor: const Color.fromARGB(255, 212, 250, 250),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('BMI Rechner'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.grey],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: Text(
                      'Gewicht',
                      style: TextStyle(
                        color: Color.fromARGB(255, 247, 111, 49),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                        activeColor: Colors.green,
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
                  const Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: Text(
                      'Groesse',
                      style: TextStyle(
                        color: Color.fromARGB(255, 247, 111, 49),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
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
              Card(
                color: coloredBMIBewertung(ergebnis),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Center(
                    child: Text(
                      ergebnis.toStringAsFixed(1),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                ),
                shadowColor: Colors.blueGrey,
                elevation: 6,
              ),
              Card(
                color: const Color.fromARGB(255, 243, 141, 45),
                child: SizedBox(
                  width: 260,
                  child: Center(
                    child: Text(
                      bMIBewertung(ergebnis),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                ),
                shadowColor: Colors.blueGrey,
                elevation: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String bMIBewertung(double ergebnis) {
  if (ergebnis < 18.5) {
    return 'Du bist untergewichtig';
  }
  if (ergebnis < 25) {
    return 'Du hast Normalgewicht';
  }
  if (ergebnis < 30) {
    return 'Du bist übergewichtig';
  }
  return 'Du bist fettleibig';
}

Color coloredBMIBewertung(double ergebnis) {
  if (ergebnis < 18.5) {
    return Colors.blue[300]!;
  }
  if (ergebnis < 25) {
    return Colors.green;
  }
  if (ergebnis < 30) {
    return Colors.orange;
  }
  return Colors.red;
}
