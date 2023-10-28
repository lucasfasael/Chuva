import 'package:chuva/widgets/activity_widget.dart';
import 'package:flutter/material.dart';

class ProfilePersonPage extends StatefulWidget {
  const ProfilePersonPage({super.key, required this.title});

  final String title;

  @override
  State<ProfilePersonPage> createState() => _ProfilePersonPageState();
}

class _ProfilePersonPageState extends State<ProfilePersonPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff456189),
        title: const Text(
          "Chuva 💜Flutter",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://static.todamateria.com.br/upload/st/ep/stepheazul.jpg",
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stephen William Hawking",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "Universidade de Cambridge",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * 0.25,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bio",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "<p>Doutor em cosmologia, foi professor lucasiano emérito por Isaac Newton, Paul DIrac e Charles Babbage. Foi, pouco antes de falecer, diretor de pesquisa do Departamento de Matemática Aplicada e Física Teórica (CTC) da Universidade de Cambridge</p>",
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActivityWidget()),
                    );
                  });
                },
                child: const Text(
                  "Atividades",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "dom., 26/11/2023",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Column(
                children: [
                  ActivityWidget(),
                  ActivityWidget(),
                  ActivityWidget(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
