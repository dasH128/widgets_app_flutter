import 'package:flutter/material.dart';

class UiControlsScreen extends StatefulWidget {
  static const String name = 'controls_screen';
  const UiControlsScreen({super.key});

  @override
  State<UiControlsScreen> createState() => _UiControlsScreenState();
}

enum Transportation { car, boat, plane, submarine }

class _UiControlsScreenState extends State<UiControlsScreen> {
  bool isDeveloper = false;
  var selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI CONTROL')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Modo Programador'),
            subtitle: const Text('Eres un programador ?'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
              isDeveloper = value;
            }),
          ),
          ExpansionTile(
            title: const Text('Vehículos de transporte'),
            subtitle: Text('Eligío: $selectedTransportation'),
            children: [
              RadioListTile<Transportation>(
                title: const Text('Por carro'),
                subtitle: const Text('transporte terrestre'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(
                  () {
                    selectedTransportation = value!;
                  },
                ),
              ),
              RadioListTile<Transportation>(
                title: const Text('Por avion'),
                subtitle: const Text('transport por aire'),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(
                  () {
                    selectedTransportation = value!;
                  },
                ),
              ),
              RadioListTile<Transportation>(
                title: const Text('Por barco'),
                subtitle: const Text('transporte marítimo'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(
                  () {
                    selectedTransportation = value!;
                  },
                ),
              ),
              RadioListTile<Transportation>(
                title: const Text('Por submarino'),
                subtitle: const Text('transporte sub acuático'),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(
                  () {
                    selectedTransportation = value!;
                  },
                ),
              ),
            ],
          ),
          CheckboxListTile(
            title: const Text('Quiere desayuno'),
            subtitle: const Text('Comida para la mañana'),
            value: wantsBreakfast,
            onChanged: (value) => setState(() {
              wantsBreakfast = value!;
            }),
          ),
          CheckboxListTile(
            title: const Text('Quiere almuerzo'),
            subtitle: const Text('Comida para la tarde'),
            value: wantsLunch,
            onChanged: (value) => setState(() {
              wantsLunch = value!;
            }),
          ),
          CheckboxListTile(
            title: const Text('Quiere cena'),
            subtitle: const Text('Comida para la noche'),
            value: wantsDinner,
            onChanged: (value) => setState(() {
              wantsDinner = value!;
            }),
          ),
        ],
      ),
    );
  }
}
