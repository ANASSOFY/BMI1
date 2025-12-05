import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "BMI calculator",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 39, 42, 70),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
