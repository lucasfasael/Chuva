import 'package:chuva/views/profile_person_page.dart';
import 'package:flutter/material.dart';

class PersonWidget extends StatefulWidget {
  const PersonWidget({super.key});

  @override
  State<PersonWidget> createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ProfilePersonPage(
                    title: 'TESTE',
                  )),
        );
      },
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://static.todamateria.com.br/upload/st/ep/stepheazul.jpg",
                ),
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stephen William Hawking",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Universidade de Cambridge",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
