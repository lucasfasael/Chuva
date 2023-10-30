import 'dart:convert';

import 'package:chuva/models/activities_model.dart';
import 'package:chuva/models/datum.dart';
import 'package:dio/dio.dart';

class ActivitiesService {
  Dio dio = Dio();

  Future<ActivitiesModel> findAll() async {
    final res = await dio.get(
        "https://raw.githubusercontent.com/chuva-inc/exercicios-2023/master/dart/assets/activities.json");
    return ActivitiesModel.fromJson(jsonDecode(res.data));
  }

  Future<List<Datum>> findAllByIdPerson(int idPerson) async {
    final resFindAll = await findAll();
    return resFindAll.data?.where((element) {
          return element.people?.any((person) => person.id == idPerson) ??
              false;
        }).toList() ??
        [];
  }
}
