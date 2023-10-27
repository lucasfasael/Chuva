import 'package:chuva/views/activities_page.dart';
import 'package:flutter/material.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({super.key});

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .24),
              offset: Offset(0, 3),
              blurRadius: 8,
            )
          ],
        ),
        width: double.maxFinite,
        height: 80,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Details()),
            );
          },
          child: Stack(
            children: [
              Container(
                width: 8,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: Colors.purple,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Palestra de 08:00 até 09:00",
                      style: TextStyle(fontSize: 10, color: Color(0xFF414141)),
                    ),
                    Text("O Cenário Multiverso: Uma Exploração"),
                    Text("Cosmológica e Filosófica")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
