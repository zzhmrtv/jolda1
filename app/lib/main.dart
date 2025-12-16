import 'package:flutter/material.dart';

void main() {
  runApp(const JoldaApp());
}

class JoldaApp extends StatelessWidget {
  const JoldaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JOLDA',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'System',
      ),
      home: const RegisterScreen(),
    );
  }
}

/* ================= REGISTER ================= */

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          const SizedBox(height: 80),
          const TitleText('Регистрация'),
          const SizedBox(height: 12),
          const SubtitleText('Быстрый вход через Google или вручную.'),
          const SizedBox(height: 24),

          // GOOGLE PLACEHOLDER
          Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(
              child: Text(
                'Google Sign In',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),

          const SizedBox(height: 16),
          const InputField(hint: 'Имя'),
          const InputField(hint: 'Email'),

          const Spacer(),

          MainButton(
            text: 'Продолжить',
            onTap: () => Navigator.push(
              context,
              fadeRoute(const StateScreen()),
            ),
          ),

          const SizedBox(height: 12),
          const FooterText('Без спама · Без обмана'),
        ],
      ),
    );
  }
}

/* ================= STATE ================= */

class StateScreen extends StatelessWidget {
  const StateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      top: const BackHeader(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          const TitleText('Штат'),
          const SizedBox(height: 12),
          const SubtitleText('Где ты сейчас?'),
          const SizedBox(height: 24),

          CardItem(
            text: 'New York',
            onTap: () => Navigator.push(
              context,
              fadeRoute(const CityScreen(state: 'New York')),
            ),
          ),
          CardItem(
            text: 'California',
            onTap: () => Navigator.push(
              context,
              fadeRoute(const CityScreen(state: 'California')),
            ),
          ),
          CardItem(
            text: 'Texas',
            onTap: () => Navigator.push(
              context,
              fadeRoute(const CityScreen(state: 'Texas')),
            ),
          ),
          CardItem(
            text: 'Florida',
            onTap: () => Navigator.push(
              context,
              fadeRoute(const CityScreen(state: 'Florida')),
            ),
          ),

          const Spacer(),
          const FooterText('Можно изменить позже'),
        ],
      ),
    );
  }
}

/* ================= CITY ================= */

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
    return BaseScreen(
      top: const BackHeader(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          const TitleText('Город'),
          const SizedBox(height: 12),
          SubtitleText('Штат: $state'),
          const SizedBox(height: 24),

          ...cities[state]!.map(
            (city) => CardItem(
              text: city,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Вы выбрали: $city')),
                );
              },
            ),
          ),

          const Spacer(),
          const FooterText('Последний шаг'),
        ],
      ),
    );
  }
}

/* ================= UI COMPONENTS ================= */

class BaseScreen extends StatelessWidget {
  final Widget child;
  final Widget? top;

  const BaseScreen({super.key, required this.child, this.top});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 40),
        child: Column(
          children: [
            if (top != null) top!,
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'JOLDA',
      style: TextStyle(
        letterSpacing: 6,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Color(0xFF3B82F6),
      ),
    );
  }
}

class BackHeader extends StatelessWidget {
  const BackHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            '← Назад',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2563EB),
            ),
          ),
        ),
        const Spacer(),
        const Header(),
      ],
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  const TitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
    );
  }
}

class SubtitleText extends StatelessWidget {
  final String text;
  const SubtitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 17, color: Color(0xFF475569)),
    );
  }
}

class InputField extends StatelessWidget {
  final String hint;
  const InputField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.all(18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const MainButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3B82F6),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: onTap,
        child: Text(text, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CardItem({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Text(text, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}

class FooterText extends StatelessWidget {
  final String text;
  const FooterText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
      ),
    );
  }
}

/* ================= ANIMATION ================= */

Route fadeRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.04),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      );
    },
  );
}