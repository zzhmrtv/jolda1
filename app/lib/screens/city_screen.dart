import 'package:flutter/material.dart';
import '../theme.dart';

class CityScreen extends StatelessWidget {
  final String state;
  const CityScreen({super.key, required this.state});

  static const cities = {
    'New York': ['New York City', 'Brooklyn', 'Queens'],
    'California': ['Los Angeles', 'San Diego', 'San Jose'],
    'Texas': ['Houston', 'Dallas', 'Austin'],
    'Florida': ['Miami', 'Orlando', 'Tampa'],
  };

  @override
  Widget build(BuildContext context) {
    final list = cities[state]!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('← Назад'),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'JOLDA',
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 6,
                      color: blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 80),

              const Text(
                'Город',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              Text(
                'Штат: $state',
                style: const TextStyle(fontSize: 17, color: textMuted),
              ),

              const SizedBox(height: 24),

              ...list.map(
                (c) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    border: Border.all(color: border),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(c, style: const TextStyle(fontSize: 18)),
                ),
              ),

              const Spacer(),

              const Center(
                child: Text(
                  'Последний шаг',
                  style: TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
