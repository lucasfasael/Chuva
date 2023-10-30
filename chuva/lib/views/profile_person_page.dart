import 'package:chuva/models/datum.dart';
import 'package:chuva/models/person.dart';
import 'package:chuva/services/activities_service.dart';
import 'package:chuva/utils/utils_data.dart';
import 'package:chuva/utils/utils_html.dart';
import 'package:chuva/widgets/activity_widget.dart';
import 'package:flutter/material.dart';

class ProfilePersonPage extends StatefulWidget {
  final Person person;
  const ProfilePersonPage({super.key, required this.person});

  @override
  State<ProfilePersonPage> createState() => _ProfilePersonPageState();
}

class _ProfilePersonPageState extends State<ProfilePersonPage> {
  late ActivitiesService activitiesService;
  List<Datum> listDatuns = [];
  @override
  void initState() {
    activitiesService = ActivitiesService();
    activitiesService.findAllByIdPerson(widget.person.id ?? 0).then(
      (value) {
        setState(
          () {
            listDatuns = value;
          },
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: widget.person.picture != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(
                                widget.person.picture!,
                              ),
                            )
                          : CircleAvatar(
                              child: Text(
                                widget.person.name.getInitials(),
                                style: const TextStyle(
                                  fontSize: 50,
                                ),
                              ),
                            ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.person.name ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        widget.person.institution ?? "",
                        style: const TextStyle(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Bio",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.person.bio?.ptBr.htmlCorrector() ?? "",
                    ),
                  ],
                ),
              ),
              const Text(
                "Atividades",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
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
              Column(
                  children:
                      listDatuns.map((e) => ActivityWidget(datum: e)).toList())
            ],
          ),
        ),
      ),
    );
  }
}
