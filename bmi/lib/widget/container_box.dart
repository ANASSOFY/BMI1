import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback onPlus;
  final VoidCallback onMinus;

  const ContainerBox({
    super.key,
    required this.title,
    required this.value,
    required this.onPlus,
    required this.onMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xff333244),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "$value",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.small(
                  heroTag: "${title}-minus",
                  onPressed: onMinus,
                  backgroundColor: Color(0xff444355),
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 10),
                FloatingActionButton.small(
                  heroTag: "${title}-plus",
                  onPressed: onPlus,
                  backgroundColor: Color(0xff444355),
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
