import 'package:chrono/pages/alarm.dart';
import 'package:chrono/pages/chronometre.dart';
import 'package:chrono/pages/horloge.dart';
import 'package:chrono/pages/minuteur.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  Widget pageActive = const Alarm();
  String page = '';

  void channgePage(texte) {
    setState(() {
      page = texte;
      if (page == 'alarm') {
        pageActive = const Alarm();
      } else if (page == 'horloge') {
        pageActive = const Horloge();
      } else if (page == 'chrono') {
        pageActive = const Chrono();
      } else if (page == 'minuteur') {
        pageActive = const Minuteur();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Menu'),

              // controleur de page
              pageActive,

              SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          channgePage('alarm');
                        },
                        child: const Text('Alarme')),
                    TextButton(
                        onPressed: () {
                          channgePage('horloge');
                        },
                        child: const Text('Horloge Mondiale')),
                    TextButton(
                        onPressed: () {
                          channgePage('chrono');
                        },
                        child: const Text('Chronomètre')),
                    TextButton(
                        onPressed: () {
                          channgePage('minuteur');
                        },
                        child: const Text('Miniteur')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      routes: {'/chrono': (context) => const Chrono()},
    );
  }
}
