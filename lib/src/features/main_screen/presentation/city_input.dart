import 'package:flutter/material.dart';

class CityInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onFetchWeather;

  const CityInput(
      {required this.controller, required this.onFetchWeather, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'City',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onFetchWeather,
          child: const Text('Weather Please!'),
        ),
      ],
    );
  }
}
