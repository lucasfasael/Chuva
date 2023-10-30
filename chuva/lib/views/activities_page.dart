import 'package:chuva/models/datum.dart';
import 'package:chuva/utils/utils_data.dart';
import 'package:chuva/utils/utils_html.dart';
import 'package:chuva/views/profile_person_page.dart';
import 'package:chuva/widgets/person_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ActivitiesPage extends StatefulWidget {
  final Datum datum;
  const ActivitiesPage({super.key, required this.datum});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  List<PersonWidget> minhaLista = [];

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              color: widget.datum.category?.color?.fixColor(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.datum.category?.title?.ptBr ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 160,
                child: Column(
                  children: [
                    Flexible(
                      child: Text(
                        widget.datum.title?.ptBr ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.alarm_rounded,
                                color: Color(0xFF306DC3),
                              ),
                              Text(
                                  "${widget.datum.start.getDayOfWeek()} ${widget.datum.start?.toHHmm()}h - ${widget.datum.end?.toHHmm()}")
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color(0xFF306DC3),
                              ),
                              Text(widget.datum.locations
                                      ?.map((e) => e.title?.ptBr)
                                      .join(", ") ??
                                  "")
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF306DC3), // Background color
                      ),
                      onPressed: () {
                        const snackBar = SnackBar(
                          content: Text('Adicionado com sucesso'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(Icons.star),
                          ),
                          Text(
                            "Adicionar à sua agenda",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      widget.datum.description?.ptBr.htmlCorrector() ?? ""),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          (widget.datum.people ?? [])
                                  .firstOrNull
                                  ?.role
                                  ?.label
                                  ?.ptBr
                                  ?.toString() ??
                              "",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: widget.datum.people!
                            .map((e) => PersonWidget(
                                  img: e.picture,
                                  name: e.name,
                                  university: e.institution,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProfilePersonPage(
                                          person: e,
                                        ),
                                      ),
                                    );
                                  },
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
