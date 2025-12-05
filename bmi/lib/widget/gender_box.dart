import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderBox({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffE83D67) : Color(0xff333244),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 100,
              color: isSelected ? Colors.white : Colors.grey[300],
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[300],
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
