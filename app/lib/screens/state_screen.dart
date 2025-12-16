import 'package:flutter/material.dart';
import '../theme.dart';
import 'city_screen.dart';

class StateScreen extends StatelessWidget {
  const StateScreen({super.key});

  static const states = [
    'New York',
    'California',
    'Texas',
    'Florida',
  ];

  @override
  Widget build(BuildContext context) {
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
                'Штат',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              const Text(
                'Где ты сейчас?',
                style: TextStyle(fontSize: 17, color: textMuted),
              ),

              const SizedBox(height: 24),

              ...states.map(
                (s) => _card(
                  s,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CityScreen(state: s),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              const Center(
                child: Text(
                  'Можно изменить позже',
                  style: TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          border: Border.all(color: border),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(text, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
