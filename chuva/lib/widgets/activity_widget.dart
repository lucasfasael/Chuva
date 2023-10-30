import 'package:chuva/models/datum.dart';
import 'package:chuva/utils/utils_data.dart';
import 'package:chuva/utils/utils_html.dart';
import 'package:chuva/views/activities_page.dart';
import 'package:flutter/material.dart';

class ActivityWidget extends StatefulWidget {
  final Datum datum;
  const ActivityWidget({super.key, required this.datum});

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
              MaterialPageRoute(
                builder: (context) => ActivitiesPage(
                  datum: widget.datum,
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                width: 8,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: widget.datum.category?.color?.fixColor(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Palestra de ${widget.datum.start.toHHmm()} até ${widget.datum.end.toHHmm()}",
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF414141),
                      ),
                    ),
                    Text(
                      widget.datum.title?.ptBr ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    if (widget.datum.people?.isNotEmpty ?? false)
                      Text(
                        widget.datum.people?.map((e) => e.name).join(", ") ??
                            "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Color(0xFF8C8C8C),
                          fontSize: 12,
                        ),
                      )
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
